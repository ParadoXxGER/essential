module Api
  module V1
    class ApiController < ActionController::API
      before_action :permit_params

      private

      def permit_params
        unless params[:tags] || params[:filter] || params[:page] || params[:posts]
          return redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'all')
        end
        @newsfeed_query ||= NewsfeedQuery.new(params)
      end
    end
  end
end
