require 'moneyable'

class OrderLineItem < ActiveRecord::Base
 attr_accessible :date, :product_id, :order_id, :price, :quantity, :subtotal, :created_by, :updated_by
 belongs_to :order
 belongs_to :product

 include Moneyable

 def to_s
  "#{product.name}: #{quantity} x $#{cents_to_dollars(price)} = $#{cents_to_dollars(subtotal)}"
 end
end
