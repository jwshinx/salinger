# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
 Customer =
  cleanName: (name) ->
   #name.replace /[-]/g, ""
   name.replace /\W/g, ""

  validFirstname: (name) ->
   cleaned_name = @cleanName(name)
  validLastname: (name) ->
   cleaned_name = @cleanName(name)

 address_validation_rules = (x) ->
  $("#new_order_form").validate()
  $("#address_type").rules(x, "required")
  $("#address_name").rules(x, "required")
  $("#address_line_one").rules(x, "required")
  $("#address_state").rules(x, "required")
  $("#address_city").rules(x, "required")
  $("#address_zip").rules(x, "required")

 $("#purchase_date_datepicker").datepicker({ dateFormat: "mm/dd/yy" })
 
 $("#order_status").blur ->
  status = $("#order_status").val()
  if status == '2' # on-hold-customer 
   address_validation_rules('remove') 
  else
   address_validation_rules('add') 

 $("#firstname").blur ->
  new_firstname = Customer.validFirstname(@value)
  if new_firstname
   $("#firstname").val(new_firstname)
  else

 $("#lastname").blur ->
  new_lastname = Customer.validLastname(@value)
  if new_lastname
   $("#lastname").val(new_lastname)
  else

 for x in [1..4]
  value = $("#customer_orders_attributes_0_line_items_attributes_#{x}_product_id").val()
  if value == ''
   $("#product_#{x}").hide()
  else
   $("#product_#{x}").show()

 $("#new_order_form").bind 'submit', (event) =>
  is_valid_form = $("#new_order_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#additional_line_item_0").bind 'click', (event) =>
  $("#product_1").show()
 $("#additional_line_item_1").bind 'click', (event) =>
  $("#product_2").show()
 $("#additional_line_item_2").bind 'click', (event) =>
  $("#product_3").show()
 $("#additional_line_item_3").bind 'click', (event) =>
  $("#product_4").show()

 $("#new_order_form").validate({
  rules: {
   'customer[firstname]': { required: true },
   'customer[lastname]': { required: true },
   'customer[email]': { required: true, email: true },
   'customer[orders_attributes][0][purchase_date]': { required: true },
   #'purchase_date_datepicker': { required: true },
   #'customer[orders_attributes][0][paid_amount]': { required: true, digits: true },
   'customer[orders_attributes][0][paid_amount]': { required: true },
   'customer[orders_attributes][0][order_status_id]': { required: true },
   'customer[orders_attributes][0][line_items_attributes][0][product_id]': { required: true },
   'customer[orders_attributes][0][line_items_attributes][0][quantity]': { required: true, digits: true, min: 1 },
  },
  messages: {
   'customer[firstname]': { required: 'Firstname must be alphanumeric.' },
   'customer[lastname]': { required: 'Lastname must be alphanumeric.' },
   'customer[email]': { required: "Email is required.", email: "It should look like an email." },
   'customer[orders_attributes][0][purchase_date]': { required: 'Date is required.' },
   'customer[orders_attributes][0][paid_amount]': { required: "A value is required (eg: 0, 10.50, 20)." },
   'customer[orders_attributes][0][line_items_attributes][0][product_id]': { required: "Please select at least one item." },
   'customer[orders_attributes][0][line_items_attributes][0][quantity]': { required: "Number of items is required.", digits: "It must be a number.", min: "Number must be greater than zero." },
  }
 });
