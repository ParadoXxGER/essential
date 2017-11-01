module Api::V1
  class FilePostsController < ApiController

    # GET /file_posts
    # GET /file_posts.json
    def index
      render json: FilePost.all
    end


  end
end