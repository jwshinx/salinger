class AddCreatedByAndUpdatedByToFabrics < ActiveRecord::Migration
  def change
    add_column :fabrics, :created_by, :integer, :null => false
    add_column :fabrics, :updated_by, :integer, :null => false
  end
end
