module InventoryConcerns          
  def reduce_inventory                           
    line_items.each { |li| li.product.update_attribute(:count, li.product.count-li.quantity) }
  end   
end