class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :description

      t.timestamps
    end
    add_index :customers, :id, unique: true
  end
end
