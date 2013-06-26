module OrderStatusesHelper
 def can_show_linkify display_text, object
  linkify( display_text, 'OrderStatus', :read, object, 'order_statuses' )
 end
end
