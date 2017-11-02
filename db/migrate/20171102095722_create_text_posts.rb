class CreateTextPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :text_posts do |t|

      t.timestamps
      t.references :post, foreign_key: true
    end
    cti_create_view('TextPost')
  end
end
