class Product < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :description, :presence => true, :length => { :minimum => 1 }
 validates :price, :numericality => { :greater_than => 0 }
 attr_accessible :description, :name, :price, :price
 has_many :sewings
 has_many :fabrics, :through => :sewings, :uniq => true
end
