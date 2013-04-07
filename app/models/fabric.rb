class Fabric < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 attr_accessible :name
 has_many :sewings
 has_many :products, :through => :sewings, :uniq => true
end
