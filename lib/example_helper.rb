module ExampleHelper
 
 def valid_customer_params item
  cust = FactoryGirl.create(:customer)
  random = Random.rand(5 ** 5)
  {:firstname=>"#{cust.firstname}#{random}", :lastname=>"#{cust.lastname}#{random}", 
   :email=> cust.email, :description=> cust.description,
   :todos_attributes=>{ "0" => {:content => FactoryGirl.create(:customer_todo).content} },
   :fyis_attributes=>{ "0" => {:content => FactoryGirl.create(:customer_fyi).content} },
   :orders_attributes=>{ "0" => valid_order_params( item ) }
  }
 end
 def valid_line_item_params item_id
  {:product_id=>item_id, :quantity=>"4"}
 end
 def valid_order_params item
  today = Date.today
  {"purchase_date(1i)"=>today.year.to_s, "purchase_date(2i)"=>today.month.to_s,
   "purchase_date(3i)"=>today.day.to_s, :paid_amount=>"8000", :order_status_id => 1,
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
