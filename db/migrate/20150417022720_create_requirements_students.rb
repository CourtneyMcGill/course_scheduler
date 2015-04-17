class CreateRequirementsStudents < ActiveRecord::Migration
  def change
    create_table :requirements_students, :id=>false do |t|
      t.references 'requirements'
      t.references 'students'
    end
  end
end
