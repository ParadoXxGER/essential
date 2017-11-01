class AddUserFilePostRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :file_posts, :user, foreign_key: true
  end
end
