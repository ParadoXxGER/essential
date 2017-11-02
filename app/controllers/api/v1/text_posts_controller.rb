module Api::V1
  class TextPostsController < ApiController

    # GET /text_posts
    # GET /text_posts.json
    def index
      @posts = TextPost.includes(:user).references(:user).select(:created_at, :content, :slug)
      render json: @posts.to_json(:include => { :user => { :only => [:username, :id, :firstname, :lastname] } })
    end

  end
end