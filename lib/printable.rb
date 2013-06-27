module Printable
 def with_start_and_end_times
  puts "\n\n---> Starting.\n"
  yield
  puts "\n---> Ending.\n\n"
 end 
 def with_display_msg object, text
  if object
   puts "---> #{object.class.to_s} #{text}: Found. Nothing Done."
  else
   yield
   puts "---> #{object.class.to_s} #{text}: Not found. Insert done."
  end
 end
end
