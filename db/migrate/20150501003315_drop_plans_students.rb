class DropPlansStudents < ActiveRecord::Migration


  def up
    drop_table :plans_students
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end


end
