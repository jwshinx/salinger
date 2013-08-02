class AddressType < ActiveRecord::Base
 include UserConcerns
 
 attr_accessible :created_by, :description, :name, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :customer_addresses
 
end

# == Schema Information
#
# Table name: address_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  created_by  :integer          not null
#  updated_by  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

