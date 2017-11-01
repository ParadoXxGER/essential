module Api::V1
  class PhotoAlbumPostsController < ApiController

    # GET /photo_album_posts
    # GET /photo_album_posts.json
    def index
      render json: PhotoAlbumPost.all
    end
  end

end