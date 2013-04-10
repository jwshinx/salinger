class Sewing < ActiveRecord::Base
 #belongs_to :product, :inverse_of => :sewings
 belongs_to :product
 belongs_to :fabric

 attr_accessible :product_id, :fabric_id
end
