class AddIndexToUsersId < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :id, unique: true
  end
end
