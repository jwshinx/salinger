module ExampleHelper
 
 def customer_hash_of_purchase  
  {:customer=>{:firstname=>"Johanne", :lastname=>"Bach", :email=>"jb@ieiie.com", 
   :description=>"", :todos_attributes=>{"0"=>{:content=>""}}, :fyis_attributes=>{"0"=>{:content=>""}}, :addresses_attributes=>{"0"=>{:address_type_id=>"#{AddressType.first.id}", :name=>"Office", :line_one=>"2 Yellow Way", :line_two=>"", :suite=>"12", :city=>"Tulsa", :state=>"AL", :zip=>"44445"}}, 
   :orders_attributes=>{"0"=>{:order_status_id=>"#{OrderStatus.first.id}", 
    :purchase_date=>"07/02/2013", :fyis_attributes=>{"0"=>{:content=>""}}, :line_items_attributes =>{"0"=>{:product_id=>"#{Product.first.id}", :quantity=>"1"}, "1"=>{:product_id=>"", :quantity=>"1"}, "2"=>{:product_id=>"", :quantity=>"1"}, "3"=>{:product_id=>"", :quantity=>"1"}, "4"=>{:product_id=>"", :quantity=>"1"}}, :paid_amount=>"8"}}}
  }
 end
 def create_product user
  f1 = Fabric.create({name: 'Black', updated_by: user.id, created_by: user.id})
  f2 = Fabric.create({name: 'Red', updated_by: user.id, created_by: user.id})
  p = Product.new({
   name: 'Jimmyz', description: 'blah',
   price: 5000, count: 10, created_by: user.id, updated_by: user.id
  })
  p.sewings.new({fabric_id:f1.id, updated_by: user.id, created_by: user.id})
  p.sewings.new({fabric_id:f2.id, updated_by: user.id, created_by: user.id})
  p.save
 end
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
