module CustomersHelper
 def and_show_count_of_notes collection
  return "No Notes" if collection.empty?
  #"#{collection.first.class.superclass.to_s} (#{collection.length})"
  "Notes (#{collection.length})"
 end
end
