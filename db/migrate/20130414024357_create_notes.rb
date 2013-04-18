class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :notable_type, :null => false
      t.integer :notable_id, :null => false
      t.string :type, :null => false
      t.string :content, :null => false
      t.timestamps
    end
    add_index :notes, :id, unique: true
  end
end
