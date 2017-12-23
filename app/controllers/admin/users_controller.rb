module Admin
  class UsersController < AdminController
    before_action :permit_params

    def index
      @users = User.page(params[:page])
                 .per(params[:users])
                 .order(created_at: :desc)
    end

    private

    def permit_params
      unless params[:page] || params[:users]
        redirect_to admin_users_path(page: 1, users: 15)
      end
    end
  end
end