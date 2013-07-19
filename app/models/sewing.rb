class Sewing < ActiveRecord::Base
 #belongs_to :product, :inverse_of => :sewings
 belongs_to :product
 belongs_to :fabric
 #belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 #belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 attr_accessible :created_by, :updated_by, :product_id, :fabric_id
end
