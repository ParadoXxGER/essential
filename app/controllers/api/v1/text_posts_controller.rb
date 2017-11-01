module Api::V1
  class TextPostsController < ApiController

    # GET /text_posts
    # GET /text_posts.json
    def index
      render json: TextPost.all
    end

  end
end