class TaskStatusType < ActiveRecord::Base
 attr_accessible :created_by, :description, :name, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates_uniqueness_of :name
 #belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 #belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 has_many :tasks, :class_name => "Task", :foreign_key => 'task_status_id'

 scope :pending, where(:name => 'Pending')
end
