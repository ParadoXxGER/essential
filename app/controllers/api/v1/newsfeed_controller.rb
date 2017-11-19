module Api::V1
  class NewsfeedController < ApiController
    before_action :permit_params
    before_action :convert_params

    def index
      newsfeed = Newsfeed.new(
        cachekey,
        @filter,
        @tags,
        @page,
        @posts_count
      )

      if newsfeed.cached
        set_cache_header('X-Cache-Hit', newsfeed.cache_key)
        return render json: newsfeed.posts
      end

      set_cache_header('X-Cache-Miss', newsfeed.cache_key)
      render json: newsfeed.posts
    end

    private

    def permit_params
      params.permit(:tags).require(:tags)
      params.permit(:filter).require(:filter)
      params.permit(:page).require(:page)
      params.permit(:posts).require(:posts)
      params.permit(:to).require(:to)
      params.permit(:from).require(:from)
      params.permit(:sort_by).require(:sort_by)
    end

    def cachekey
      filter = @filter.map do |filter|
        filter = "filter-#{filter}"
      end.sort!.reverse!.join(' ')

      tags = @tags.map do |tag|
        tag = "tag-#{tag}"
      end.sort!.reverse!.join(' ')

      "#{filter.parameterize}-#{tags.parameterize}-page:#{params[:page]}-posts:#{params[:posts]}"
    end

    def set_cache_header(key, value)
      response.set_header(key, value)
    end

    def convert_params
      @tags = params[:tags].split(' ')
      @filter = params[:filter].split(' ')
      @sort_by = params[:sort_by]
      @posts_count = params[:posts]
      @page = params[:page]
    end
  end
end
