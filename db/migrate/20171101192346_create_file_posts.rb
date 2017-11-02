class CreateFilePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :file_posts do |t|

      t.string :file_url

      t.references :post, foreign_key: true

      t.timestamps
    end

    cti_create_view('FilePost')
  end
end
