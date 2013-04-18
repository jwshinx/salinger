class Fabric < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :sewings
 #has_many :products, :through => :sewings, :uniq => true
 has_many :products, :through => :sewings
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 attr_accessible :name
end
