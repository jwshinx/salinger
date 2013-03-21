class Role < ActiveRecord::Base
 attr_accessible :description, :name
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :description, :presence => true, :length => { :minimum => 1 }
 has_many :users
end
