class CreatePhotoAlbumPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_album_posts do |t|

      t.string :photo_url
      t.references :post, foreign_key: true

      t.timestamps
    end
    cti_create_view('PhotoAlbumPost')
  end
end
