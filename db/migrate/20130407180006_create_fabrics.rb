class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :fabrics, :name
    add_index :fabrics, :id, unique: true
  end
end
