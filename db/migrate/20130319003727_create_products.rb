class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.decimal :price, :precision => 5, :scale => 2, :null => false

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :id, unique: true
  end
end
