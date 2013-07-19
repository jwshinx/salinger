class OrderStatus < ActiveRecord::Base
  attr_accessible :created_by, :description, :title, :updated_by
  validates :title, :description, :presence => true
  has_many :orders
end
