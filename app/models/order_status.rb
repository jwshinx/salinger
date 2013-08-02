class OrderStatus < ActiveRecord::Base
  attr_accessible :created_by, :description, :title, :updated_by
  validates :title, :description, :presence => true
  has_many :orders
end

# == Schema Information
#
# Table name: order_statuses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  updated_by  :integer
#  created_by  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

