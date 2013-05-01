class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :content, :null => false
      t.integer :email_type_id, :null => false
      t.integer :updated_by
      t.integer :created_by

      t.timestamps
    end
  end
end
