class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
      t.string "name"
     t.string "username", limit: 20, null: false
     t.string "password_digest", null:false
     t.string "email", null: false
     
     t.timestamps null: false
    end
  end
end
