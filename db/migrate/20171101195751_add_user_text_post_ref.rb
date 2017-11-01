class AddUserTextPostRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :text_posts, :user, foreign_key: true
  end
end
