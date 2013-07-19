module OrderStatusesHelper 
  def can_edit_linkify object
   edit_linkify( 'Edit', :update, object, 'order_statuses' )
  end
end
