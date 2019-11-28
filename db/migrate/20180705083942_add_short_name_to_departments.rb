class AddShortNameToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :short_name, :string
  end
end
