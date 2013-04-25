module Moneyable
 def cents_to_dollars amount
  return 0 if amount.nil? || amount =~ /[^\d]/
  amount.to_i / 100.0
 end
end
