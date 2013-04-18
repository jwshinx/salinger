class AddCreatedByAndUpdatedByToProducts < ActiveRecord::Migration
  def change
    add_column :products, :created_by, :integer, :null => false
    add_column :products, :updated_by, :integer, :null => false
  end
end
