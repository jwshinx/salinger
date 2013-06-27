module OrderStatusesHelper
 def can_show_linkify display_text, object
  show_linkify( display_text, :read, object, 'order_statuses' )
 end
 def can_edit_linkify object
  edit_linkify( 'Edit', :update, object, 'order_statuses' )
 end
end
