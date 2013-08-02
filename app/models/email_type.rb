class EmailType < ActiveRecord::Base
 attr_accessible :description, :name, :created_by, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :emails

end

# == Schema Information
#
# Table name: email_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  updated_by  :integer          not null
#  created_by  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

