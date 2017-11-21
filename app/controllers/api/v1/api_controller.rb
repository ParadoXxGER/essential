module Api
  module V1
    class ApiController < ActionController::API
      before_action :create_newsfeed_query

      private

      def create_newsfeed_query
        @newsfeed_query = NewsfeedQuery.new(params)
      end
    end
  end
end
