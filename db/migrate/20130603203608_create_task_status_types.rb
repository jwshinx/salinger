class CreateTaskStatusTypes < ActiveRecord::Migration
  def change
    create_table :task_status_types do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false

      t.timestamps
    end
  end
end
