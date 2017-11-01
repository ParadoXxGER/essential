class AddUserPhotoAlbumPostRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :photo_album_posts, :user, foreign_key: true
  end
end
