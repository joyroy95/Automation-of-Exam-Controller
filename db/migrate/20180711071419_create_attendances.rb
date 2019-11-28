class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :atten

      t.timestamps
    end
    add_reference :attendances, :batches
    add_reference :attendances, :terms
    add_reference :attendances, :users
  end
end
