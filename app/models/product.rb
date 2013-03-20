class Product < ActiveRecord::Base
 validates :name, :presence => true
 validates :name, :length => { :minimum => 1 }
 attr_accessible :description, :name, :price, :price
end
