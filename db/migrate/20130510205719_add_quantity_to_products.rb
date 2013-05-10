class AddQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :count, :integer, :null => false
  end
end
