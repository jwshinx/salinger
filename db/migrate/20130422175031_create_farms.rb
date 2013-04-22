class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name, :null => false
      t.integer :address_id, :null => false
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false
      t.string :contact
      t.string :phone

      t.timestamps
    end
    add_index :farms, :id, unique: true
    add_index :farms, :name
  end
end
