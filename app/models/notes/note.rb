class Note < ActiveRecord::Base
 attr_accessible :content
 belongs_to :notable, :polymorphic => true
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 def owner 
  notable
 end

end
