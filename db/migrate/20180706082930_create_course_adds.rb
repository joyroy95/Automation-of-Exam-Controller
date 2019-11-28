class CreateCourseAdds < ActiveRecord::Migration[5.1]
  def change
    create_table :course_adds do |t|

      t.timestamps
    end
    add_reference :course_adds, :registrations
    add_reference :course_adds, :courses
  end
end
