# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> 
 $("#new_customer_address_form").bind 'submit', (event) =>
  is_valid_form = $("#new_customer_address_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#new_customer_address_form").validate(
  rules: {
   'customer_address[address_type_id]': { required: true },
   'customer_address[name]': { required: true },
   'customer_address[line_one]': { required: true },
   'customer_address[city]': { required: true },
   'customer_address[state]': { required: true },
   'customer_address[zip]': { required: true }
  },
  messages: {
   'customer_address[address_type_id]': { required: "Please select an address type."}
  }
 )

 $("#customer_addresses_table").tablesorter(
  sortList: [[0,0]],
  widgets: ['zebra'],
  headers: { 9: { sorter: false }, 10: { sorter: false } }
 )
