class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.integer :exam_year
      t.timestamps
    end
    add_reference :registrations, :degrees
    add_reference :registrations, :terms
    add_reference :registrations, :users
    add_reference :registrations, :exam_statuses
    add_reference :registrations, :batches
  end
end
