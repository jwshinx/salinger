namespace :joel do
 desc "Address type, Email type and task status type"
 task :insert_meta_data => [:environment] do
  begin
   puts "\n\n---> Starting.\n"

   shipping_type = AddressType.find_by_name 'Shipping'
   joel_admin = User.find_by_username 'joel'
   if shipping_type
    puts "---> Shipping: Found. Nothing Done." 
   else
    shipping_type = AddressType.create( {name: 'Shipping', description: 'Product was shipped here. Do not delete this.', created_by: joel_admin.id, updated_by: joel_admin.id } )
    puts "---> Shipping: Not found. Insert done." 
   end

   puts "\n---> Ending.\n\n"

  rescue Exception => e
   puts "---> Exception. Task not performed: #{e.inspect}."
  end
 end
end
