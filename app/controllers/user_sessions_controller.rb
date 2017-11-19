class UserSessionsController < ApplicationController
  layout 'public'
  skip_before_action :ensure_login

  before_action :permit_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'all', from: '2017-11-02', to: '2017-11-03', sort_by: 'date')
    else
      redirect_to '/login'
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to '/login'
  end

  private

  def permit_params
    params[:user_session].permit!
  end
end
