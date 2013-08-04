class User < ActiveRecord::Base
 # authlogic adds basic validation on username and email eg
 acts_as_authentic                                                                                                                               
 validates :username, :email, uniqueness: true     
 validates :username, :email, :role_id, :password, presence: true
 attr_accessible :active, :crypted_password, :email, :password_salt, :persistence_token, :role_id, :username, :password, :password_confirmation
 belongs_to :role               
                             
 %w(Product Fabric Sewing Customer Email EmailType TaskStatusType OrderStatus AddressType CustomerAddress).each do |model|
   send('has_many', "created_#{model.underscore.pluralize}", :class_name => "#{model}", :foreign_key => "created_by")
   send('has_many', "updated_#{model.underscore.pluralize}", :class_name => "#{model}", :foreign_key => "updated_by")  
 end
                                                                                        
 %w(Fyi Todo).each do |model|
   send('has_many', "created_#{model.underscore.pluralize}", :class_name => "#{model}", :foreign_key => "created_by", :conditions => ['type = ?', "#{model}"])
   send('has_many', "updated_#{model.underscore.pluralize}", :class_name => "#{model}", :foreign_key => "updated_by", :conditions => ['type = ?', "#{model}"])  
 end

 scope :managers, joins(:role).where(:roles => {:name => 'manager'})

 def admin?
  !role.nil? && role.name == 'admin' ? true : false
 end
 def manager?
  !role.nil? && role.name == 'manager' ? true : false
 end
end

# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string(255)      not null
#  email             :string(255)      not null
#  active            :boolean          default(TRUE), not null
#  role_id           :integer          not null
#  crypted_password  :string(255)      not null
#  password_salt     :string(255)      not null
#  persistence_token :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

