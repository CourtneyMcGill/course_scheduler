class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
