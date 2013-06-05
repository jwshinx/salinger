class CustomerAddress < ActiveRecord::Base
  attr_accessible :city, :line_one, :line_two, :name, :state, :suite, :zip, :created_by, :updated_by
  belongs_to :customer, :class_name => "Customer", :foreign_key => "customer_id"
  belongs_to :type, :class_name => "AddressType", :foreign_key => "address_type_id"
  validates :line_one, :name, :state, :city, :zip, :presence => true, :length => { :minimum => 1 }
end
