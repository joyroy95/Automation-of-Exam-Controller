class AddShortNameToDegrees < ActiveRecord::Migration[5.1]
  def change
    add_column :degrees, :short_name, :string
  end
end
