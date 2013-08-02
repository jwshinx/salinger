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

# == Schema Information
#
# Table name: order_line_items
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(1), not null
#  price      :integer          not null
#  subtotal   :integer          not null
#  order_id   :integer          not null
#  product_id :integer          not null
#  updated_by :integer          not null
#  created_by :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

