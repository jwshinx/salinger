class TaskStatusType < ActiveRecord::Base
 attr_accessible :created_by, :description, :name, :updated_by
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates_uniqueness_of :name
 has_many :tasks, :class_name => "Task", :foreign_key => 'task_status_id'

 scope :pending, where(:name => 'Pending')
end

# == Schema Information
#
# Table name: task_status_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)      not null
#  created_by  :integer          not null
#  updated_by  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

