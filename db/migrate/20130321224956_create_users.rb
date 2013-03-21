class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.boolean :active, :default => true, :null => false
      t.integer :role_id, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :id, unique: true
  end
end
