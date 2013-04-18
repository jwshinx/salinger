class User < ActiveRecord::Base
 # authlogic adds basic validation on username and email eg
 acts_as_authentic
 attr_accessible :active, :crypted_password, :email, :password_salt, :persistence_token, :role_id, :username, :password, :password_confirmation
 belongs_to :role
 has_many :created_products, :class_name => "Product", :foreign_key => "created_by"
 has_many :updated_products, :class_name => "Product", :foreign_key => "updated_by"
 #belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 def admin?
  !role.nil? && role.name == 'admin' ? true : false
 end
 def manager?
  !role.nil? && role.name == 'manager' ? true : false
 end
end
