class Product < ActiveRecord::Base
 include MyValidators
 include Moneyable 
 include NoteConcerns
           
 has_paper_trail
 has_string_array_of_notes
 
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :count, :presence => true, :length => { :minimum => 1 }
 validates :count, :numericality => { :only_integer => true }
 validates :description, :presence => true, :length => { :minimum => 1 }
 validates :price, :numericality => { :greater_than => 0 }, :format => { :with => /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/ }
 has_many :sewings, :dependent => :destroy
 has_many :fabrics, :through => :sewings, :uniq => true
 accepts_nested_attributes_for :sewings, :allow_destroy => true, :reject_if => lambda { |a| a[:fabric_id].blank? }
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 has_many :line_items, :class_name => "OrderLineItem"
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 before_save :ensure_that_one_fabric_belongs_to_a_product
 attr_accessible :created_by, :updated_by, :description, :name, :count,
  :price, :sewings_attributes, :todos_attributes, :fyis_attributes
             
 def to_s
  "#{name} - #{description}: $#{cents_to_dollars(price)}, Count: #{count}"
 end

 alias_method :blurb, :to_s

private

 before_validation do |product|
  if product.sewings.collect{|s|s.fabric_id}.uniq.count == product.sewings.length
   true
  else
   errors[:base] << "Product must be comprised of unique fabrics. No duplicate fabrics."
   false
  end
 end

 def ensure_that_one_fabric_belongs_to_a_product
  if self.sewings.length < 1 
   errors.add(:base, "Product must be made of at least one fabric.")
    return false
  else
   return true
  end
 end 
end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text             default(""), not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :integer          not null
#  updated_by  :integer          not null
#  count       :integer          not null
#

