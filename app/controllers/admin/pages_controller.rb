module Admin
  class PagesController < AdminController
    before_action :permit_params

    private

    def permit_params
      redirect_to admin_pages_path(page: 1, pages: 15) unless params[:page] || params[:pages]
    end
  end
end
