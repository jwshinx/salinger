require 'my_validators'

class Product < ActiveRecord::Base
 include MyValidators

 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :count, :presence => true, :length => { :minimum => 1 }
 validates :count, :numericality => { :only_integer => true }
 validates :description, :presence => true, :length => { :minimum => 1 }
 #validates :price, :numericality => { :greater_than => 0 }, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/ }
 #validates :price, :numericality => true, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/ }
 validates :price, :numericality => { :greater_than => 0 }, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/ }
 #validates :price, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/ }

 #validates :price, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/,
 #   :message => "must be in dollars and cents" }
 #validates_with MyValidators::PriceDollarAmount
 #has_many :sewings, :dependent => :destroy, :inverse_of => :product
 has_many :sewings, :dependent => :destroy
 has_many :fabrics, :through => :sewings, :uniq => true
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 accepts_nested_attributes_for :sewings, :allow_destroy => true, :reject_if => lambda { |a| a[:fabric_id].blank? }
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 has_many :line_items, :class_name => "OrderLineItem"
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 attr_accessible :created_by, :updated_by, :description, :name, :count,
  :price, :sewings_attributes, :todos_attributes, :fyis_attributes

private

 before_validation do |product|
  if product.sewings.collect{|s|s.fabric_id}.uniq.count == product.sewings.length
   true
  else
   errors[:base] << "Product must be comprised of unique fabrics. No duplicate fabrics."
   false
  end
 end
 
end
