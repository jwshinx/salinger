class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, :null => false
      t.string :suite
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false

      t.timestamps
    end
    add_index :addresses, :id, unique: true
    add_index :addresses, :street
  end
end
