class Address < ActiveRecord::Base
 attr_accessible :city, :created_by, :state, :street, :suite, :updated_by, :zip
 validates :street, :city, :state, :zip, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 has_many :farms
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
end
