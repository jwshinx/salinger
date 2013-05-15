module MyValidators
 Owner = 'joel'
 
 class PriceDollarAmount < ActiveModel::Validator
  def validate(record)
   if record.price =~ /^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/
    record.errors[:base] << "This person is evil"
   end
  end
 end
end
