class CreateCoursesStudents < ActiveRecord::Migration
  def change
    create_table :courses_students, :id=>false do |t|
      t.references 'courses'
      t.references 'products'
    end
  end
end
