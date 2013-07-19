class Address < ActiveRecord::Base
 include UserConcerns
 attr_accessible :city, :created_by, :state, :street, :suite, :updated_by, :zip
 validates :street, :city, :state, :zip, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 has_many :farms
end
