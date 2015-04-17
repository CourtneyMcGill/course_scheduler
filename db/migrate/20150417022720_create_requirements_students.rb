class CreateRequirementsStudents < ActiveRecord::Migration
  def change
    create_table :requirements_students, id: false do |t|
      t.integer 'requirement_id'
      t.integer 'student_id'
    end
  end
end
