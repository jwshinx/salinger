class EmailType < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 attr_accessible :name, :description, :updated_by, :created_by
end
