module Api
  module V1
    class PostsController < ApiController

      def create
        @post = Post.new(user: User.first, content: params[:text])
        add_tags
        add_filter
        @post.save
      end

      private

      def add_tags
        @newsfeed_query.tags.each do |tag|
          @post.tags << Tag.new(text: tag, post: @post)
        end
      end

      def add_filter
        @newsfeed_query.filter.each do |filter|
          @post.filter << Filter.new(text: filter, post: @post)
        end
      end
    end
  end
end
