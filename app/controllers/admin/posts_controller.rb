module Admin
  class PostsController < AdminController
    before_action :permit_params

    def index
      @posts = Post.includes(:user)
                   .references(:user)
                   .page(params[:page])
                   .per(params[:posts])
                   .order(created_at: :desc)
    end

    private

    def permit_params
      redirect_to admin_posts_path(page: 1, posts: 15) unless params[:page] || params[:posts]
    end
  end
end
