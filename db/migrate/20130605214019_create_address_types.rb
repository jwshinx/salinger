class CreateAddressTypes < ActiveRecord::Migration
  def change
    create_table :address_types do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false

      t.timestamps
    end
  end
end
