class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_login
  before_action :create_newsfeed_query

  helper_method :current_user_session, :current_user

  private

  def create_newsfeed_query
    @newsfeed_query = NewsfeedQuery.new(params)
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def ensure_login
    return redirect_to '/login' unless current_user
  end
end
