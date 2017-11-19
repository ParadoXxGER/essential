module Api::V1
  class PostsController < ApiController
    before_action :permit_input, only: [:create]
    before_action :permit_pagination, only: [:index]

    def create
      post = Post.new
      post.user = User.first
      post.content = params[:text]

      params[:tags].split(' ').each do |tag|
        post.tags << Tag.new(text: tag, post: post)
      end

      params[:filter].split(' ').each do |filter|
        post.filter << Filter.new(text: filter, post: post)
      end

      post.save
    end

    private

    def permit_input
      params.permit(:text, :tags, :filter)
    end

    def permit_pagination
      params.permit(:page, :posts_count)
    end
  end
end
