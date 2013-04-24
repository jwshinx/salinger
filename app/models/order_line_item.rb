class OrderLineItem < ActiveRecord::Base
  attr_accessible :date, :order_id, :price, :quantity, :subtotal
end
