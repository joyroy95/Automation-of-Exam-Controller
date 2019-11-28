class CreateHalls < ActiveRecord::Migration[5.1]
  def up
    create_table :halls do |t|
      t.string :name, limit: 60, null: false
      t.timestamp null: false
    end
    execute <<-SQL
      CREATE UNIQUE INDEX unique_hall_name on
        halls(lower(name));
    SQL
  end

  def down
    drop_table :halls
  end
end
