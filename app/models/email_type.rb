class EmailType < ActiveRecord::Base
 attr_accessible :description, :name, :created_by, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 has_many :emails

end
