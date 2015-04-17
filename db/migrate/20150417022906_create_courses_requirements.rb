class CreateCoursesRequirements < ActiveRecord::Migration
  def change
    create_table :courses_requirements, id: false do |t|
      t.integer 'course_id'
      t.integer 'requirement_id'
    end
  end
end
