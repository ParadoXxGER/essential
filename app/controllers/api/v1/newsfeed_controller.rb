module Api::V1
  class NewsfeedController < ApiController

    before_action :permit_params, only: [:index]

    def index
      render json: newsfeed_posts.to_json(
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
    end

    private

    def newsfeed_posts
      @posts = []
      @posts += PhotoAlbumPost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts += TextPost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts += FilePost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts]).order(created_at: :desc)
      @posts.sort_by { |post| Date.parse(post.created_at.to_s)}
      @posts
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

  end
end