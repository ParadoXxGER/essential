module Api::V1
  class PhotoAlbumPostsController < ApiController

    # GET /photo_album_posts
    # GET /photo_album_posts.json
    def index
      @posts = PhotoAlbumPost.includes(:user, :comments).references(:user, :comments)
      render json: @posts.to_json(
        include: {
          user: {
            only: %i[username,id,firstname,lastname]
          },
          comments: {
            include: {
              user: { only: [:username, :id, :firstname, :lastname]}
            }
          }
        })
    end
  end

end