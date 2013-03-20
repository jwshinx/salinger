class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 2

      t.timestamps
    end
    add_index :products, :name
  end
end
