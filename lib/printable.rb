module Printable
 def with_start_and_end_times
  puts "\n\n---> Starting.\n"
  yield
  puts "\n---> Ending.\n\n"
 end 
 def with_display_msg model, object, text
  if object
   puts "---> #{model} #{text}: Found. Nothing Done."
  else
   yield
   puts "---> #{model} #{text}: Not found. Insert done."
  end
 end
end
