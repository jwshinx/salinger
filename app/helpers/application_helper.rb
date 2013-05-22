module ApplicationHelper
 def and_show_count_of collection
  return "No #{params[:controller].capitalize}" if collection.empty?
  "#{params[:controller].capitalize} (#{collection.length})"
 end
 def cents_to_dollars amount
  return 0 if amount.nil? || amount =~ /[^\d]/
  amount.to_i / 100.0
 end
 def mmddyy_date date
  date.nil? ? '' : date.strftime("%m/%d/%Y")
 end
end
