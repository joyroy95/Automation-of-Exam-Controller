class CreateTermTypes < ActiveRecord::Migration[5.1]
  def up
    create_table :term_types do |t|
      t.string "name", null: false, limit: 12
      t.integer "exam_per_year", null: false
    end
  end

  def down
    drop_table :term_types
  end
end
