class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :purchase_date, :null => false
      t.date :paid_date
      t.integer :customer_id, :null => false
      t.integer :purchase_amount, :null => false
      t.integer :paid_amount, :default => 0, :null => false
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false
      t.boolean :ispaid, :default => false, :null => false

      t.timestamps
    end
    add_index :orders, :id, unique: true
  end
end
