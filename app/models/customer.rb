class Customer < ActiveRecord::Base
 attr_accessible :created_by, :updated_by, :description, 
  :email, :firstname, :lastname, :todos_attributes, :fyis_attributes
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 has_many :orders
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 validates :email, :firstname, :lastname, :presence => true, :length => { :minimum => 1 }

 def fullname
  "#{firstname} #{lastname}"
 end
end

