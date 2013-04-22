class Farm < ActiveRecord::Base
 attr_accessible :address, :phone, :contact, :name, :created_by, :updated_by
 validates :name, :address_id, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 belongs_to :address
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
end
