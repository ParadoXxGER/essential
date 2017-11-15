module Api::V1
  class PostsController < ApiController

    before_action :permit_input, only: [:create]
    before_action :permit_pagination, only: [:index]

    def create
      post = Post.new
      post.user = User.first
      post.content = params[:text]

      if post.save
        add_filter_to(post)
        add_tags_to(post)
      end
    end

    private

    def add_tags_to(post)
      params[:tags].split(' ').each do |tag|
        Tag.create(text: tag, post: post)
      end
    end

    def add_filter_to(post)
      params[:filter].split(' ').each do |filter|
        Filter.create(text: filter, post: post)
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