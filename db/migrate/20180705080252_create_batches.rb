class CreateBatches < ActiveRecord::Migration[5.1]
  def up
    create_table :batches do |t|
      t.string  :name, limit: 150
      t.integer :degree_id, null: false
      t.integer  :term_type_id, null: false
      t.integer :department_id, null: false
      t.integer :session, null: false
      t.integer :total_credit, null: false
      t.integer :total_length_in_year, limit: 1
      t.timestamps  null: false
    end
    add_index :batches, [:department_id, :degree_id, :session], unique: true, name: 'unique_batch'
    add_index :batches, :term_type_id
    add_foreign_key :batches, :degrees
    add_foreign_key :batches, :term_types
    add_foreign_key :batches, :departments
  end

  def down
    drop_table :batches
  end
end
