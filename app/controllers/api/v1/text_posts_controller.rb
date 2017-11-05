module Api::V1
  class TextPostsController < ApiController

    before_action :permit_input, only: [:create]
    before_action :permit_pagination, only: [:index]

    # GET /text_posts
    # GET /text_posts.json
    def index
      @posts = TextPost.includes(:user, :comments).references(:user, :comments).page(params[:page]).per(params[:posts_count])
      render json: @posts.to_json(
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

    def create

      tpost = TextPost.new
      tpost.user_id = 1
      tpost.content = params[:text]
      tpost.save

    end

    private

    def permit_input
      params.permit(:text)
    end

    def permit_pagination
      params.permit(:page, :posts_count)
    end

  end
end