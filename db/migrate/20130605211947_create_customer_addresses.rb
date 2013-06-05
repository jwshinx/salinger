class CreateCustomerAddresses < ActiveRecord::Migration
  def change
    create_table :customer_addresses do |t|
      t.references :customer, :null => false
      t.references :address_type, :null => false
      t.string :name
      t.string :line_one, :null => false
      t.string :line_two
      t.string :suite
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false

      t.timestamps
    end
  end
end
