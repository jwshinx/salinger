module ReportQueries
 def get_product_count_of_unique_fabrics
  # returns product_name and fabric_count
  Product.find_by_sql(
   [ 
    "select p.name product_name, count(*) fabric_count from sewings s " + 
    "left join products p on s.product_id = p.id " + 
    "left join fabrics f on s.fabric_id = f.id " + 
    "group by p.name " + 
    "order by fabric_count asc " 
   ]
  )
 end
end
