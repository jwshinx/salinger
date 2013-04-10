class Product < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :description, :presence => true, :length => { :minimum => 1 }
 validates :price, :numericality => { :greater_than => 0 }
 #has_many :sewings, :dependent => :destroy, :inverse_of => :product
 has_many :sewings, :dependent => :destroy
 has_many :fabrics, :through => :sewings, :uniq => true
 #has_many :fabrics, :through => :sewings
 accepts_nested_attributes_for :sewings, :reject_if => lambda { |a| a[:fabric_id].blank? }, :allow_destroy => true

 attr_accessible :description, :name, :price, :sewings_attributes
end
