class AddCreatedByAndUpdatedByToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :created_by, :integer, :null => false
    add_column :notes, :updated_by, :integer, :null => false
  end
end
