class CustomerAddress < ActiveRecord::Base
  include UserConcerns
  attr_accessible :customer_id, :address_type_id, :city, :line_one, :line_two, :name, :state, :suite, :zip, :created_by, :updated_by
  belongs_to :customer, :class_name => "Customer", :foreign_key => "customer_id"
  belongs_to :type, :class_name => "AddressType", :foreign_key => "address_type_id"
  validates :line_one, :name, :state, :city, :zip, :presence => true, :length => { :minimum => 1 }
end

# == Schema Information
#
# Table name: customer_addresses
#
#  id              :integer          not null, primary key
#  customer_id     :integer          not null
#  address_type_id :integer          not null
#  name            :string(255)
#  line_one        :string(255)      not null
#  line_two        :string(255)
#  suite           :string(255)
#  city            :string(255)      not null
#  state           :string(255)      not null
#  zip             :string(255)      not null
#  updated_by      :integer          not null
#  created_by      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

