class Email < ActiveRecord::Base
 attr_accessible :content, :created_by, :email_type_id, :updated_by
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 belongs_to :email_type

 validate :email_must_look_like_email_address

 def email_must_look_like_email_address
  unless self.content =~ Regexp.new("^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$", true)
   errors.add(:Email, "must look like an email address") 
  end
 end
end
