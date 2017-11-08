module Api::V1
  class TextPostsController < ApiController

    before_action :permit_input, only: [:create]
    before_action :permit_pagination, only: [:index]

    # GET /text_posts
    # GET /text_posts.json
    def index
      @posts = TextPost.includes(:user, :comments).references(:user, :comments).order(created_at: :desc).page(params[:page]).per(params[:posts_count])
      render json: @posts.to_json(
        include: {
          user: {
            only: [:username, :id, :firstname, :lastname]
          },
          comments: {
            include: {
              user: { only: [:username, :id, :firstname, :lastname]}
            }
          }
        })
    end

    def create
      invalidate_cache_by_tag("*")
      invalidate_cache_by_filter("*")
      tpost = TextPost.new
      tpost.user_id = 1
      tpost.content = params[:text]
      tpost.save
    end

    private

    def permit_input
      params.permit(:text)
    end

    def permit_pagination
      params.permit(:page, :posts_count)
    end

    def invalidate_cache_by_filter(filter)
      keys = REDIS_CLIENT.keys("*tag-#{filter}*")
      keys.each do |key|
        puts key
        REDIS_CLIENT.del(key)
      end
    end

    def invalidate_cache_by_tag(tag)
      keys = REDIS_CLIENT.keys("*tag-#{tag}*")
      keys.each do |key|
        puts key
        REDIS_CLIENT.del(key)
      end
    end

  end
end