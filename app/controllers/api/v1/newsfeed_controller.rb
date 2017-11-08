module Api::V1
  class NewsfeedController < ApiController

    before_action :permit_params, only: [:index]

    def index
      if REDIS_CLIENT.exists(cachekey)

        setHeader('x-cache-hit', cachekey)
        return serve_cached_newsfeed(cachekey)
      end

      setHeader('x-cache-miss', cachekey)
      serve_newsfeed_and_populate_cache
    end

    private

    def serve_newsfeed_and_populate_cache
      @posts = []
      @posts += PhotoAlbumPost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts += TextPost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts += FilePost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts.sort_by { |post| Date.parse(post.created_at.to_s)}
      @posts = @posts.to_json(
        include: {
          user: {
            only: [:username, :id, :firstname, :lastname]
          },
          comments: {
            include: {
              user: { only: [:username, :id, :firstname, :lastname]}
            }
          }
      })
      REDIS_CLIENT.set(cachekey, @posts)
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
      render json: JSON.parse(REDIS_CLIENT.get(cachekey))
    end

    def setHeader(key, value)
      response.set_header(key, value)
    end

  end
end