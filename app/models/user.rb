class User < ActiveRecord::Base
 # authlogic adds basic validation on username and email eg
 acts_as_authentic
 attr_accessible :active, :crypted_password, :email, :password_salt, :persistence_token, :role_id, :username, :password, :password_confirmation
 belongs_to :role
 has_many :created_products, :class_name => "Product", :foreign_key => "created_by"
 has_many :updated_products, :class_name => "Product", :foreign_key => "updated_by"
 has_many :created_fabrics, :class_name => "Fabric", :foreign_key => "created_by"
 has_many :updated_fabrics, :class_name => "Fabric", :foreign_key => "updated_by"
 has_many :created_sewings, :class_name => "Sewing", :foreign_key => "created_by"
 has_many :updated_sewings, :class_name => "Sewing", :foreign_key => "updated_by"
 has_many :created_customers, :class_name => "Customer", :foreign_key => "created_by"
 has_many :updated_customers, :class_name => "Customer", :foreign_key => "updated_by"

 has_many :created_emails, :class_name => "Email", :foreign_key => "created_by"
 has_many :updated_emails, :class_name => "Email", :foreign_key => "updated_by"
 has_many :created_email_types, :class_name => "EmailType", :foreign_key => "created_by"
 has_many :updated_email_types, :class_name => "EmailType", :foreign_key => "updated_by"
 has_many :created_task_status_types, :class_name => "TaskStatusType", :foreign_key => "created_by"
 has_many :updated_task_status_types, :class_name => "TaskStatusType", :foreign_key => "updated_by"
 has_many :created_order_status, :class_name => "OrderStatus", :foreign_key => "created_by"
 has_many :updated_order_status, :class_name => "OrderStatus", :foreign_key => "updated_by"
 has_many :created_address_types, :class_name => "AddressType", :foreign_key => "created_by"
 has_many :updated_address_types, :class_name => "AddressType", :foreign_key => "updated_by"
 has_many :created_customer_addresses, :class_name => "CustomerAddress", :foreign_key => "created_by"
 has_many :updated_customer_addresses, :class_name => "CustomerAddress", :foreign_key => "updated_by"

 has_many :created_fyis, 
  :class_name => "Note", :foreign_key => "created_by", :conditions => ['type = ?', 'Fyi'] 
 has_many :updated_fyis, 
  :class_name => "Note", :foreign_key => "updated_by", :conditions => ['type = ?', 'Fyi']
 has_many :created_todos, 
  :class_name => "Note", :foreign_key => "created_by", :conditions => ['type = ?', 'Todo'] 
 has_many :updated_todos, 
  :class_name => "Note", :foreign_key => "updated_by", :conditions => ['type = ?', 'Todo']

 scope :managers, joins(:role).where(:roles => {:name => 'manager'})

 def admin?
  !role.nil? && role.name == 'admin' ? true : false
 end
 def manager?
  !role.nil? && role.name == 'manager' ? true : false
 end
end
