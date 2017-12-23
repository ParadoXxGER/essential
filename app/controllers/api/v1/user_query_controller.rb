module Api
  module V1
    class UserQueryController < ApiController
      before_action :user_params

      def execute
        render json: UserQuery.new(user_params).execute.to_json
      end

      private

      def user_params
        params.permit(:username, :firstname, :email, :id, :lastname, :posts, :created_at).to_h
      end
    end
  end
end
