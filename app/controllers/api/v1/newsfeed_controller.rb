module Api::V1
  class NewsfeedController < ApiController

    before_action :permit_params, only: [:index]

    def index

      if REDIS_CACHE_CLIENT.exists(cachekey)
        setHeader('X-Cache-Hit', cachekey)
        return serve_cached_newsfeed(cachekey)
      end

      if params[:filter] == 'all'
        return serve_newsfeed_all
      end

      setHeader('X-Cache-Hit', cachekey)
      serve_newsfeed_and_populate_cache
    end

    private

    def serve_newsfeed_all
      @posts = []
      @posts += PhotoAlbumPost
                  .includes(:user, :comments, :tags, :filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page])
                  .per(params[:posts])
                  .order(created_at: :desc)
      @posts += TextPost
                  .includes(:user, :comments, :tags, :filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .order(created_at: :desc)
      @posts += FilePost
                  .includes(:user, :comments, :tags, :filter)
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .per(params[:posts])
                  .order(created_at: :desc)

      @posts = @posts.to_json(
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
            only: [:text, :id]
          },
          filter: {
            only: [:text, :id]
          }
        },
        methods: :type
      )
      render json: @posts
    end

    def serve_newsfeed_and_populate_cache
      @posts = []
      @posts += PhotoAlbumPost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", params[:filter].split(' '))
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page])
                  .per(params[:posts])
                  .order(created_at: :desc)
      @posts += TextPost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", params[:filter].split(' '))
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .order(created_at: :desc)

      @posts += FilePost
                  .includes(:user, :comments, :tags, :filter)
                  .where("filters.text IN (?)", params[:filter].split(' '))
                  .references(:user, :comments, :tags, :filter)
                  .page(params[:page]).per(params[:posts])
                  .per(params[:posts])
                  .order(created_at: :desc)

      @posts = @posts.to_json(
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
        methods: :type
      )

      REDIS_CACHE_CLIENT.set(cachekey, @posts)
      render json: @posts

    end

    def permit_params

      unless params[:tags] || params[:filter] || params[:page] || params[:posts]
        return redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'none')
      end

      params.permit(:tags)
      params.permit(:filter)
      params.permit(:page)
      params.permit(:posts)
    end

    def cachekey

      filter = params[:filter].split(' ').map do |filter|
        filter = "filter-#{filter}"
      end.sort.join(' ')

      tags = params[:tags].split(' ').map do |tag|
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

  end
end