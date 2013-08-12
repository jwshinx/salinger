class Email < ActiveRecord::Base
 include UserConcerns
 attr_accessible :content, :created_by, :email_type_id, :updated_by
 belongs_to :email_type

 validate :email_must_look_like_email_address

 def email_must_look_like_email_address
  unless self.content =~ Regexp.new("^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$", true)
   errors.add(:Email, "must look like an email address") 
  end
 end
end

# == Schema Information
#
# Table name: emails
#
#  id            :integer          not null, primary key
#  content       :string(255)      not null
#  email_type_id :integer          not null
#  updated_by    :integer
#  created_by    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

