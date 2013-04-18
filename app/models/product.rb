class Product < ActiveRecord::Base
 validates :name, :presence => true, :length => { :minimum => 1 }
 validates :description, :presence => true, :length => { :minimum => 1 }
 validates :price, :numericality => { :greater_than => 0 }
 #has_many :sewings, :dependent => :destroy, :inverse_of => :product
 has_many :sewings, :dependent => :destroy
 has_many :fabrics, :through => :sewings, :uniq => true
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 #has_many :fabrics, :through => :sewings
 accepts_nested_attributes_for :sewings, :reject_if => lambda { |a| a[:fabric_id].blank? }, :allow_destroy => true
 has_many :todos, :as => :notable, :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 #accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:fabric_id].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :todos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 attr_accessible :description, :name, :price, :sewings_attributes, :todos_attributes, :fyis_attributes
end
