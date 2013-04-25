module ApplicationHelper
 def mmddyy_date date
  date.nil? ? '' : date.strftime("%m/%d/%Y")
 end
end
