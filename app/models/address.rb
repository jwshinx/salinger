class Address < ActiveRecord::Base
 include UserConcerns
 attr_accessible :city, :created_by, :state, :street, :suite, :updated_by, :zip
 validates :street, :city, :state, :zip, :created_by, :updated_by, :presence => true, :length => { :minimum => 1 }
 has_many :farms
end

# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string(255)      not null
#  suite      :string(255)
#  city       :string(255)      not null
#  state      :string(255)      not null
#  zip        :string(255)      not null
#  updated_by :integer          not null
#  created_by :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

