module ExampleHelper
 
 def valid_email fname, lname, salt
  "#{fname}#{lname}#{salt}@yahoo.com"
 end
 def invalid_email
  ''
 end
 def valid_customer_params item
  firstname = "Miles"; lastname = "Davis"; random = Random.rand(5 ** 5)
  {:firstname=>"#{firstname}#{random}", :lastname=>"#{lastname}#{random}", 
   :email=> valid_email(firstname, lastname, random), :description=>"first customer",
   :todos_attributes=>{ "0" => valid_todo_params },
   :fyis_attributes=>{ "0" => valid_fyi_params },
   :orders_attributes=>{ "0" => valid_order_params( item ) }
  }
 end
 def valid_fyi_params
  {:content=>"he is cool"}
 end
 def valid_todo_params
  {:content=>"send receipt"}
 end
 def valid_line_item_params item_id
  {:product_id=>item_id, :quantity=>"4"}
 end
 def valid_order_params item
  today = Date.today
  {"purchase_date(1i)"=>today.year.to_s, "purchase_date(2i)"=>today.month.to_s,
   "purchase_date(3i)"=>today.day.to_s, :paid_amount=>"8000",
   :line_items_attributes=>{
    "0" => valid_line_item_params( item.id )
   }
  }
 end
 def valid_purchase_params
  orange_argyle = FactoryGirl.create(:orange_argyle)
  { :customer => valid_customer_params( orange_argyle ) }
 end
 
end
