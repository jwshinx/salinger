class User < ActiveRecord::Base
  attr_accessible :active, :crypted_password, :email, :password_salt, :persistence_token, :role_id, :username
end
