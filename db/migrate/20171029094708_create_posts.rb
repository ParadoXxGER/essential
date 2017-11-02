class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.string :content
      t.index :content

      t.string :slug
      t.index :slug

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
