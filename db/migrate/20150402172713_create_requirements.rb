class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.integer :course

      t.timestamps null: false
    end
  end
end
