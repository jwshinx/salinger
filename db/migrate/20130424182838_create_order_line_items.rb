class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.date :date, :null => false
      t.integer :quantity, :null => false, :default => 1
      t.integer :price, :null => false
      t.integer :subtotal, :null => false
      t.integer :order_id, :null => false

      t.timestamps
    end
    add_index :order_line_items, :id, unique: true
  end
end
