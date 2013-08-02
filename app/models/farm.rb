class Farm < ActiveRecord::Base
 attr_accessible :address_id, :phone, :contact, :name, :created_by, :updated_by
 validates :name, :address_id, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 belongs_to :address
 #accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address_id].blank? }, :allow_destroy => true
end

# == Schema Information
#
# Table name: farms
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  address_id :integer          not null
#  created_by :integer          not null
#  updated_by :integer          not null
#  contact    :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

