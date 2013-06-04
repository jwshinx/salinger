class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, :null => false
      t.text :description
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false
      t.date :due_date
      t.date :completed_on
      t.integer :completed_by
      t.integer :assigned_to
      t.integer :task_status_id, :null => false

      t.timestamps
    end
  end
end
