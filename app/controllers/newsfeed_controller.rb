class NewsfeedController < ApplicationController

  before_action :permit_params
  before_action :populate_filter, only: [:show]
  before_action :populate_tags, only: [:show]


  private

  def populate_filter
    @filter = params[:filter].split(' ')
  end

  def populate_tags
    @tags = params[:tags].split(' ')
  end

  def permit_params

    unless params[:tags] || params[:filter] || params[:page] || params[:posts] || params[:from] || params[:to] || params[:sort_by]
      return redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'all', from: '2017-11-01', to: '2017-11-02', sort_by: 'date')
    end

    params.permit(:tags)
    params.permit(:filter)
    params.permit(:page)
    params.permit(:posts)
    params.permit(:from)
    params.permit(:to)
    params.permit(:sort_by)
  end

end