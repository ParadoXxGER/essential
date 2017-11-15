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
      serve_newsfeed
    end

    private

    def serve_newsfeed
      posts = []
      posts += Post
              .includes(:user, :comments, :tags, :filter, :links, :photos)
              .where("filters.text IN (?)", @filter)
              .references(:user, :comments, :tags, :filter)
              .page(params[:page])
              .per(params[:posts])
              .order(created_at: :desc)

      posts.map do |post|
        post.weight = 0
        post.created_at = post.created_at.strftime("%B %d %Y %H:%M")
        post.tags.each do |tag|
          if @tags.include?(tag.text)
            post.weight += 1
          else
            post.weight -= 0.5
          end
        end
        post.tags = post.tags.sort_by(&:text).reverse!
        post
      end

      case @sort_by
        when 'date'
          posts
        when 'weight'
          posts.sort_by!(&:weight).reverse!
        else
          posts
      end

      posts = create_response(posts)

      populate_cache(cachekey, posts)

      render json: posts

    end

    def permit_params
      params.permit(:tags).require(:tags)
      params.permit(:filter).require(:filter)
      params.permit(:page).require(:page)
      params.permit(:posts).require(:posts)
      params.permit(:to).require(:to)
      params.permit(:from).require(:from)
      params.permit(:sort_by).require(:sort_by)
    end

    def cachekey
      filter = @filter.map do |filter|
        filter = "filter-#{filter}"
      end.sort!.reverse!.join(' ')

      tags = @tags.map do |tag|
        tag = "tag-#{tag}"
      end.sort!.reverse!.join(' ')

      "#{filter.parameterize}-#{tags.parameterize}-page:#{params[:page]}-posts:#{params[:posts]}"
    end

    def serve_cached_newsfeed(cachekey)
      puts cachekey
      render json: JSON.parse(REDIS_CACHE_CLIENT.get(cachekey))
    end

    def setHeader(key, value)
      response.set_header(key, value)
    end

    def convert_params
      @tags = params[:tags].split(' ')
      @filter = params[:filter].split(' ')
      @sort_by = params[:sort_by]
    end

    def populate_cache(key, value)
      return if CACHE_ENABLED == 'false'
      REDIS_CACHE_CLIENT.set(key, value)
      puts "CACHE SET: #{key}"
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
        methods: [:weight]
      )
    end
  end
end