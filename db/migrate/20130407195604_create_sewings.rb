class CreateSewings < ActiveRecord::Migration
  def change 
    create_table :sewings do |t|
      t.integer :fabric_id, :null => false
      t.integer :product_id, :null => false
      t.timestamps
    end
    add_index :sewings, :product_id
    add_index :sewings, :fabric_id
  end
end
