module ExampleHelper
 
 def valid_customer_params
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
  random = Random.rand(5 ** 5)
  {
   :customer=>{:firstname=>"Miles#{random}", :lastname=>"Davis#{random}", :email=>"md#{random}@yahoo.com",
    :description=>"first customer",
    :todos_attributes=>{
     "0" => valid_todo_params
    },
    :fyis_attributes=>{
     "0" => valid_fyi_params
    },
    :orders_attributes=>{
     "0" => valid_order_params( orange_argyle )
    }
   }
  }
 end
 
end
