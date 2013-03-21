class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :null => false
      t.string :description, :null => false

      t.timestamps
    end
    add_index :roles, :name
    add_index :roles, :id, unique: true
  end
end
