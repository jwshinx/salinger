require 'printable'

namespace :joel do
 include Printable

 desc "Address type, Email type and task status type"
 task :insert_meta_data => [:environment] do
  begin

   with_start_and_end_times do
    text = 'Shipping'
    object = AddressType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     AddressType.create( { name: text, description: 'Product was shipped here. Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

    text = 'Billing'
    object = AddressType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     AddressType.create( { name: text, description: 'Product was billed here. Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

    text = 'Email Signup'
    object = EmailType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     EmailType.create( { name: text, description: 'Visitors submit these on website. Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

    text = 'Pending'
    object = TaskStatusType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     TaskStatusType.create( { name: text, description: 'Work on it. Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

    text = 'On Hold'
    object = TaskStatusType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     TaskStatusType.create( { name: text, description: 'No work being done. Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

    text = 'Complete'
    object = TaskStatusType.find_by_name text 
    joel_admin = User.find_by_username 'joel'
    with_display_msg( object, text ) do
     TaskStatusType.create( { name: text, description: 'Done, yay! Do not delete this.', 
                           created_by: joel_admin.id, updated_by: joel_admin.id } )
    end

   end 

  rescue Exception => e
   puts "---> Exception. Task not performed: #{e.inspect}."
  end
 end
end
