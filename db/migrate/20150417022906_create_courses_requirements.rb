class CreateCoursesRequirements < ActiveRecord::Migration
  def change
    create_table :courses_requirements, :id=>false do |t|
      t.references 'courses'
      t.references 'requirements'
    end
  end
end
