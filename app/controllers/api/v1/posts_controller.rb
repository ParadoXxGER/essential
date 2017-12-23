module Api
  module V1
    class PostsController < ApiController
      before_action :permit_params

      def create
        @post = Post.new(user: User.first, content: params[:text])
        add_tags
        add_filter
        @post.save
      end

      private

      def permit_params
        unless params[:tags] || params[:filter] || params[:page] || params[:posts]
          return redirect_to newsfeed_path(page: 1, posts: 15, tags: 'all', filter: 'all')
        end
        @newsfeed_query ||= NewsfeedQuery.new(params)
      end
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
