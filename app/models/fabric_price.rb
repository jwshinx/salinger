class FabricPrice < ActiveRecord::Base                                                
 include UserConcerns
  
 attr_accessible :amount, :date, :created_by, :updated_by
 validates :amount, :date, :presence => true
 belongs_to :fabric
end

# == Schema Information
#
# Table name: fabric_prices
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  date       :date             not null
#  updated_by :integer          not null
#  created_by :integer          not null
#  fabric_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

