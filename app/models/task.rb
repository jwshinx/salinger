class Task < ActiveRecord::Base
 attr_accessible :assigned_to, :completed_by, :completed_on, :created_by, :description, :due_date, :task_status_id, :title, :updated_by
 validates :title, :presence => true, :length => { :minimum => 1 }
 belongs_to :status, :class_name => "TaskStatusType", :foreign_key => 'task_status_id'
 has_paper_trail                                                                                                                                                                           
 
 def completer
  User.where(:id => completed_by).first.username
 end
 
 def assignee 
  User.where(:id => assigned_to).first.username
 end
                        
 def summary
  title
 end
  
 alias_method :blurb, :summary 
end

# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  description    :text
#  updated_by     :integer          not null
#  created_by     :integer          not null
#  due_date       :date
#  completed_on   :date
#  completed_by   :integer
#  assigned_to    :integer
#  task_status_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

