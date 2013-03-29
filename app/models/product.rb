class Product < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :description, :presence => true, :length => { :minimum => 1 }
 validates :price, :numericality => { :greater_than => 0 }
 attr_accessible :description, :name, :price, :price
end
