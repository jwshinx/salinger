class OrderLineItem < ActiveRecord::Base
  attr_accessible :date, :product_id, :order_id, :price, :quantity, :subtotal
  belongs_to :order
  belongs_to :product
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
end
