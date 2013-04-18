class AddCreatedByAndUpdatedByToSewings < ActiveRecord::Migration
  def change
    add_column :sewings, :created_by, :integer, :null => false
    add_column :sewings, :updated_by, :integer, :null => false
  end
end
