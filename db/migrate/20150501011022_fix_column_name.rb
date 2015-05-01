class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :plans_students, :course_id, :plan_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
