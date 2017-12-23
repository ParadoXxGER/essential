module Admin
  class PagesController < AdminController
    before_action :permit_params

    private

    def permit_params
      unless params[:page] || params[:pages]
        redirect_to admin_pages_path(page: 1, pages: 15)
      end
    end
  end
end