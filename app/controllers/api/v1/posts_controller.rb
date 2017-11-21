module Api
  module V1
    class PostsController < ApiController
      before_action :permit_input, only: [:create]
      before_action :permit_pagination, only: [:index]

      def create
        @post = Post.new(user: User.first, content: params[:text])
        add_tags
        add_filter
        @post.save
      end

      private

      def add_tags
        params[:tags].split(' ').each do |tag|
          @post.tags << Tag.new(text: tag, post: post)
        end
      end

      def add_filter
        params[:filter].split(' ').each do |filter|
          @post.filter << Filter.new(text: filter, post: post)
        end
      end

      def permit_input
        params.permit(:text, :tags, :filter)
      end

      def permit_pagination
        params.permit(:page, :posts_count)
      end
    end
  end
end
