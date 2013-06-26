# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 $("#new_order_status_form").bind 'submit', (event) =>
  is_valid_form = $("#new_order_status_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#new_order_status_form").validate(
  rules: {
   'order_status[title]': { required: true },
   'order_status[description]': { required: true }
  }
 )

 $("#order_statuses_table").tablesorter(
  sortList: [[0,0]],
  widgets: ['zebra'],
  headers: { 4: { sorter: false }, 5: { sorter: false } }
 )
