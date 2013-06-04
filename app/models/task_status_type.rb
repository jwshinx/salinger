class TaskStatusType < ActiveRecord::Base
 attr_accessible :created_by, :description, :name, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 has_many :tasks

 scope :pending, where(:name => 'Pending')
end
