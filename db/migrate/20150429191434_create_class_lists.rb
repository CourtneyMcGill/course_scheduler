class CreateClassLists < ActiveRecord::Migration
  def change
    create_table :class_lists do |t|
      t.integer :course_id
      t.boolean :in_progress

      t.timestamps null: false
    end
  end
end
