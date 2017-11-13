module Api::V1
  class TextPostsController < ApiController

    before_action :permit_input, only: [:create]
    before_action :permit_pagination, only: [:index]

    def create
      tpost = TextPost.new
      tpost.user_id = User.first.id
      tpost.content = params[:text]

      if tpost.save
        add_filter_to(tpost)
        add_tags_to(tpost)
      end
    end

    private

    def add_tags_to(post)
      params[:tags].split(' ').each do |tag|
        Tag.create(text: tag, post: post)
      end
    end

    def add_filter_to(post)
      byebug
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