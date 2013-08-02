class Retailer < ActiveRecord::Base
  attr_accessible :address_id, :contact, :created_by, :name, :phone, :updated_by
 validates :name, :address_id, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 belongs_to :address
end

# == Schema Information
#
# Table name: retailers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  address_id :integer          not null
#  phone      :string(255)
#  contact    :string(255)
#  updated_by :integer          not null
#  created_by :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

