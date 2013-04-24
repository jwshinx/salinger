class Order < ActiveRecord::Base
  attr_accessible :created_by, :customer_id, :ispaid, :paid_amount, :paid_date, :purchase_amount, :purchase_date, :updated_by
end
