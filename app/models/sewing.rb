class Sewing < ActiveRecord::Base
 belongs_to :product
 belongs_to :fabric
 attr_accessible :created_by, :updated_by, :product_id, :fabric_id
 has_paper_trail
end

# == Schema Information
#
# Table name: sewings
#
#  id         :integer          not null, primary key
#  fabric_id  :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created_by :integer          not null
#  updated_by :integer          not null
#

