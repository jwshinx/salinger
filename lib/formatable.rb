module Formatable
 def convert_dollars_to_cents dollar_string
  return 0 unless dollar_string =~ /^((\d*)|(\d*\.\d{2})|(\d*\.\d{1}))$/
  (dollar_string.to_f * 100.0).round
 end
 def mmddyy_date date
  date.nil? ? '' : date.strftime("%m/%d/%Y")
 end
 def mmddyy_format date
  Date.strptime(date, '%m/%d/%Y')
 end
end
