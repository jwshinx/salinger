class Task < ActiveRecord::Base
  attr_accessible :assigned_to, :completed_by, :completed_on, :created_by, :description, :due_date, :task_status_id, :title, :updated_by
 validates :title, :presence => true, :length => { :minimum => 1 }
 belongs_to :status, :class_name => "TaskStatusType", :foreign_key => 'task_status_id'
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 def completer
  User.where(:id => completed_by).first.username
 end
 
 def assignee 
  User.where(:id => assigned_to).first.username
 end
end
