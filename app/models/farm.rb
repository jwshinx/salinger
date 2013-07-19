class Farm < ActiveRecord::Base
 attr_accessible :address_id, :phone, :contact, :name, :created_by, :updated_by
 validates :name, :address_id, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 belongs_to :address
 #accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address_id].blank? }, :allow_destroy => true
end
