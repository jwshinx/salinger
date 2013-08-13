class Fabric < ActiveRecord::Base     
 include UserConcerns
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates_uniqueness_of :name
 has_many :sewings
 has_many :products, :through => :sewings
 has_many :prices, :class_name => "FabricPrice", :dependent => :destroy

 accepts_nested_attributes_for :prices, :allow_destroy => true, :reject_if => lambda { |a| a[:amount].blank? }
 attr_accessible :name, :created_by, :updated_by, :prices_attributes
 has_paper_trail
 
 def current_price
  prices.order('date desc').empty? ? 0 : prices.order('date desc').first.amount
 end
end

# == Schema Information
#
# Table name: fabrics
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created_by :integer          not null
#  updated_by :integer          not null
#

