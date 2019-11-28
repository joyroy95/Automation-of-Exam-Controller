class CreateCourseTypes < ActiveRecord::Migration[5.1]
  def up
    create_table :course_types do |t|
      t.string :name, limit: 20, null:false
    end

    execute <<-SQL
    CREATE UNIQUE INDEX unique_course_type_name ON
    COURSE_TYPES (lower(name))
    SQL
  end

  def down
  	drop_table :course_types
  end
end
