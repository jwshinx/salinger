class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name, :null => false
      t.integer :address_id, :null => false
      t.string :phone
      t.string :contact
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false

      t.timestamps
    end
    add_index :retailers, :id, unique: true
    add_index :retailers, :name
  end
end
