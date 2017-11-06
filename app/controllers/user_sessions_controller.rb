class UserSessionsController < ApplicationController

  layout 'public'
  skip_before_action :ensure_login

  before_action :permit_params, only: [:create]


  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    byebug
    if @user_session.save
      redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'none')
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end

  private

  def permit_params
    params[:user_session].permit!
  end

end