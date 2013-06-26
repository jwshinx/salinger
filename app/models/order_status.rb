class OrderStatus < ActiveRecord::Base
  attr_accessible :created_by, :description, :title, :updated_by
  validates :title, :description, :presence => true
  has_many :orders
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
end
