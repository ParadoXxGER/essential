module Api::V1
  class NewsfeedController < ApiController

    before_action :permit_params
    before_action :convert_params

    def index

      if REDIS_CACHE_CLIENT.exists(cachekey)
        setHeader('X-Cache-Hit', cachekey)
        return serve_cached_newsfeed(cachekey)
      end

      setHeader('X-Cache-Hit', cachekey)
      serve_newsfeed_and_populate_cache
    end

    private

    def serve_newsfeed_and_populate_cache
      posts = []
      posts += PhotoAlbumPost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", @filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page])
                  .per(params[:posts])
                  .order(created_at: :desc)
      posts += TextPost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", @filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .order(created_at: :desc)

      posts += FilePost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", @filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .per(params[:posts])
                  .order(created_at: :desc)

      posts.map do |post|
        post.weight = 0
        post.tags.each do |tag|
          if @tags.include?(tag.text)
            post.weight += 1
          else
            post.weight -= 0.5
          end
        end
        post
      end

      case post.sort_by
        when 'date'
          posts.sort_by!(&:weight).reverse!
        when 'weight'
          posts.sort_by!(&:created_at)
        else
          posts.sort_by!(&:created_at)
      end

      posts = create_response(posts)

      REDIS_CACHE_CLIENT.set(cachekey, posts)
      puts "CACHE SET: #{cachekey}"

      render json: posts

    end

    def permit_params
      params.permit(:tags).require(:tags)
      params.permit(:filter).require(:filter)
      params.permit(:page).require(:page)
      params.permit(:posts).require(:posts)
      params.permit(:to).require(:to)
      params.permit(:from).require(:from)
    end

    def cachekey
      filter = @filter.map do |filter|
        filter = "filter-#{filter}"
      end.sort.join(' ')

      tags = @tags.map do |tag|
        tag = "tag-#{tag}"
      end.sort.join(' ')

      "#{filter.parameterize}-#{tags.parameterize}-page:#{params[:page]}-posts:#{params[:posts]}"
    end

    def serve_cached_newsfeed(cachekey)
      render json: JSON.parse(REDIS_CACHE_CLIENT.get(cachekey))
    end

    def setHeader(key, value)
      response.set_header(key, value)
    end

    def convert_params
      @tags = params[:tags].split(' ')
      @filter = params[:filter].split(' ')
    end

    def create_response(posts)
      posts.to_json(
        include: {
          user: {
            only: [:username, :id, :firstname, :lastname]
          },
          comments: {
            include: {
              user: { only: [:username, :id, :firstname, :lastname]}
            }
          },
          tags: {
            only: [:text]
          },
          filter: {
            only: [:text]
          }
        },
        methods: [:type, :weight]
      )
    end
  end
end