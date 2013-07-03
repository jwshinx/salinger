require 'starburstroma'

class Customer < ActiveRecord::Base
 include Starburstroma

 attr_accessible :created_by, :updated_by, :description, 
  :email, :firstname, :lastname, :todos_attributes, :fyis_attributes, :orders_attributes, :addresses_attributes
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 has_many :orders
 accepts_nested_attributes_for :orders
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 has_many :addresses, :class_name => 'CustomerAddress', :foreign_key => "customer_id"
 accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:line_one].blank? }, :allow_destroy => true

 validates :email, :firstname, :lastname, :presence => true, :length => { :minimum => 1 }

 after_validation do |c|
  c.firstname = cleaned_up(c.firstname) 
  c.lastname = cleaned_up(c.lastname) 
 end

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
end

