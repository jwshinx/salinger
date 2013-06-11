class Note < ActiveRecord::Base
 attr_accessible :content, :created_by, :updated_by, :notable_id, :notable_type, :type
 belongs_to :notable, :polymorphic => true
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 def owner 
  notable
 end

 #alias_method :blurb, :content
end
