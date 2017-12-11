class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_login
  before_action :permit_params

  helper_method :current_user_session, :current_user

  private

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

  def permit_params
    unless params[:tags] || params[:filter] || params[:page] || params[:posts]
      return redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'all')
    end
    @newsfeed_query ||= NewsfeedQuery.new(params)
  end
end
