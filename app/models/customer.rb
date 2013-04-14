class Customer < ActiveRecord::Base
 attr_accessible :description, :email, :firstname, :lastname

 validates :email, :firstname, :lastname, :presence => true, :length => { :minimum => 1 }
end
