class CreateEmailTypes < ActiveRecord::Migration
  def change
    create_table :email_types do |t|
      t.string :name, :null => false
      t.string :description, :nul => false
      t.integer :updated_by, :null => false
      t.integer :created_by, :null => false

      t.timestamps
    end
  end
end
