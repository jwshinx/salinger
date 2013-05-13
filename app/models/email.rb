class Email < ActiveRecord::Base
 validates :content, :presence => true, :length => { :minimum => 1 }

 attr_accessible :content, :email_type_id
end
