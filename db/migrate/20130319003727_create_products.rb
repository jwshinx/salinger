class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.integer :price, :null => false 

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :id, unique: true
  end
end
