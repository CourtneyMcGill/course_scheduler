class AddRequirementIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :requirement_id, :integer
  end
end
