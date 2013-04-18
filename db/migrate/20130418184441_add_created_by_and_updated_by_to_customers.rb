class AddCreatedByAndUpdatedByToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :created_by, :integer, :null => false
    add_column :customers, :updated_by, :integer, :null => false
  end
end
