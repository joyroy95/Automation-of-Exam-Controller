class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false, primary_key: :id do |t|
      t.integer :id
      t.string :name
      t.string :email
      t.timestamps
    end
    add_reference :users, :departments
  end
end
