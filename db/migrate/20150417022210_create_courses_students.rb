class CreateCoursesStudents < ActiveRecord::Migration
  def change
    create_table :courses_students, id: false do |t|
      t.integer 'course_id'
      t.integer 'student_id'
    end
  end
end
