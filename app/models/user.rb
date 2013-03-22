class User < ActiveRecord::Base
 # authlogic adds basic validation on username and email eg
 acts_as_authentic
 attr_accessible :active, :crypted_password, :email, :password_salt, :persistence_token, :role_id, :username, :password, :password_confirmation
 belongs_to :role
end
