class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
	t.integer :crn
	t.string :course_name
	t.text :title
	t.string :instructor
	t.string :days
	t.integer :starts
	t.integer :ends
	t.string :building_room
	t.decimal :credits, precision:10, scale:2
	t.string :coreq
	t.string :crosslist
	t.text :restrictions
	t.string :prereq
	t.text :notes
      t.timestamps null: false
    end
  end
end
