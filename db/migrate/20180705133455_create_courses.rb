class CreateCourses < ActiveRecord::Migration[5.1]
  def up
    create_table :courses do |t|
      t.string "code", null: false, limit: 60
      t.string "name", null: false, limit: 60
      t.integer "course_type_id", null: false
      t.integer "batch_id", null:false
      t.integer "term", limit: 1, null:false
      t.boolean "is_major", null:false
      t.boolean "is_optional", null: false, default: false
      t.integer "credit", limit: 1, null:false

      t.timestamps null: false
    end

    add_index :courses, :course_type_id
    add_index :courses, :batch_id
    add_foreign_key "courses", "course_types"
    add_foreign_key "courses", "batches"
  end

  def down
    drop_table :courses
  end
end
