class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :title
      t.text :description
      t.integer :updated_by
      t.integer :created_by

      t.timestamps
    end
  end
end
