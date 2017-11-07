class NewsfeedController < ApplicationController

  before_action :permit_params
  before_action :populate_filter, only: [:show]
  before_action :populate_tags, only: [:show]

  def show
    unless params[:page] || params[:posts_count]
      return redirect_to '/?page=1&posts_count=15'
    end
  end


  private

  def populate_filter
    @filter = params[:filter].split(' ')
  end

  def populate_tags
    @tags = params[:tags].split(' ')
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

  def build_cache_key
    cachekey = "#{params[:filter]}#{params[:tags]}"
    cachekey.parameterize
  end


end