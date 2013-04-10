class Fabric < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :sewings
 #has_many :products, :through => :sewings, :uniq => true
 has_many :products, :through => :sewings

 attr_accessible :name
end
