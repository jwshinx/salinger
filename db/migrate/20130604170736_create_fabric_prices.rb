class CreateFabricPrices < ActiveRecord::Migration
  def change
    create_table :fabric_prices do |t|
      t.integer :amount, :null => false
      t.date :date, :null => false
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false
      t.references :fabric, :null => false

      t.timestamps
    end
  end
end
