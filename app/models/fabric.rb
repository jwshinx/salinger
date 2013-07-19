class Fabric < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates_uniqueness_of :name
 has_many :sewings
 #has_many :products, :through => :sewings, :uniq => true
 has_many :products, :through => :sewings
 has_many :prices, :class_name => "FabricPrice", :dependent => :destroy

 accepts_nested_attributes_for :prices, :allow_destroy => true, :reject_if => lambda { |a| a[:amount].blank? }
 #belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 #belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 attr_accessible :name, :created_by, :updated_by, :prices_attributes

 def current_price
  prices.order('date desc').empty? ? 0 : prices.order('date desc').first.amount
 end
end
