module Formatable
 def convert_dollars_to_cents dollar_string
  return 0 unless dollar_string =~ /^((\$\d*)|(\$\d*\.\d{2})|(\d*)|(\d*\.\d{2}))$/
  dollar_string.to_f * 100.0
 end
end
