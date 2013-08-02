require 'starburstroma'
#require 'creator'  
#require File.expand_path("../concerns", __FILE__)
#Dir[Rails.root.join("app/models/concerns/*.rb")].each {|f| require f} 
                         
class Customer < ActiveRecord::Base
 include Starburstroma  
 include UserConcerns

 attr_accessible :created_by, :updated_by, :description, 
  :email, :firstname, :lastname, :todos_attributes, :fyis_attributes, :orders_attributes, :addresses_attributes
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 has_many :orders
 accepts_nested_attributes_for :orders
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 has_many :addresses, :class_name => 'CustomerAddress', :foreign_key => "customer_id"
 accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:line_one].blank? }, :allow_destroy => true

 validates :email, :firstname, :lastname, :presence => true, :length => { :minimum => 1 }
 validate :requires_unique_name 
 
 after_validation do |c|
  c.firstname = cleaned_up(c.firstname) 
  c.lastname = cleaned_up(c.lastname) 
 end
 scope :with_name_like, ->(fname, lname) { where('firstname like ? and lastname like ?', '%' + fname + '%', '%' + lname + '%') }

 def recent_orders
  orders.order('purchase_date desc')
 end
 def last_order
  return nil if recent_orders.blank?
  recent_orders.first
 end
 def fullname
  "#{firstname} #{lastname}"
 end
 
 def todos_and_fyis
  (todos + fyis)
 end

 alias_method :blurb, :fullname

private
 def requires_unique_name  
  same_name_customer = Customer.find_by_firstname_and_lastname(firstname, lastname) 
  if same_name_customer
    unless (self == same_name_customer)
     errors.add(:base, "Firstname/lastname combination already exists. Send information to jwshin@gmail.com.")
    end
  end   
 end
end

# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  firstname   :string(255)      not null
#  lastname    :string(255)      not null
#  email       :string(255)      not null
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :integer          not null
#  updated_by  :integer          not null
#

