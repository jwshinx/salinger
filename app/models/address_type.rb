class AddressType < ActiveRecord::Base
 attr_accessible :created_by, :description, :name, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :customer_addresses
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

end
