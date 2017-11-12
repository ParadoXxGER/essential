class CreateFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :filters do |t|

      t.string :text
      t.index :text

      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
