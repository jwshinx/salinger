class EmailType < ActiveRecord::Base
 attr_accessible :description, :name, :created_by, :updated_by
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 has_many :emails

end
