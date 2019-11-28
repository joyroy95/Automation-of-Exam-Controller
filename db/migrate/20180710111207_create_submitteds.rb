class CreateSubmitteds < ActiveRecord::Migration[5.1]
  def change
    create_table :submitteds do |t|
      t.string :name

      t.timestamps
    end
  end
end
