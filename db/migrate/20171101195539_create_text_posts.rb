class CreateTextPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :text_posts do |t|
      t.string :content
      t.index :content

      t.string :slug
      t.index :slug

      t.timestamps
    end
  end
end
