module ApplicationHelper
 def cents_to_dollars amount
  return 0 if amount.nil? || amount =~ /[^\d]/
  amount.to_i / 100.0
 end
 def mmddyy_date date
  date.nil? ? '' : date.strftime("%m/%d/%Y")
 end
end
