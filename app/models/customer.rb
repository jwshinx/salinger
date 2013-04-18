class Customer < ActiveRecord::Base
 attr_accessible :description, :email, :firstname, :lastname
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"

 validates :email, :firstname, :lastname, :presence => true, :length => { :minimum => 1 }
end
