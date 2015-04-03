class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first
      t.string :last
      t.string :sid
      t.integer :courses_taken
      t.integer :courses_progress
    end
  end
end
