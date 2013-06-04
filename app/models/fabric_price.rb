class FabricPrice < ActiveRecord::Base
 attr_accessible :amount, :date, :created_by, :updated_by
 validates :amount, :date, :presence => true
 belongs_to :fabric
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
end
