class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname

      t.string :email

      # Authlogic::ActsAsAuthentic::Password
      t.string :crypted_password
      t.string :password_salt

      t.string :persistence_token
      t.index :persistence_token, unique: true

      # Authlogic::Session::MagicColumns
      t.integer :login_count, default: 0, null: false
      t.integer :failed_login_count, default: 0, null: false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.string :last_login_ip

      t.boolean :active, default: false
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
