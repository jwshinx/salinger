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

 value = $("#customer_orders_attributes_0_line_items_attributes_1_product_id").val()
 if value == ''
  console.log "add_product_1 was clicked; but no value"
  $("#product_1").hide()
 else
  console.log "add_product_1 was clicked: #{value}"
  $("#product_1").show()
 
 value = $("#customer_orders_attributes_0_line_items_attributes_2_product_id").val()
 if value == ''
  console.log "add_product_2 was clicked; but no value"
  $("#product_2").hide()
 else
  console.log "add_product_2 was clicked: #{value}"
  $("#product_2").show()

 value = $("#customer_orders_attributes_0_line_items_attributes_3_product_id").val()
 if value == ''
  console.log "add_product_3 was clicked; but no value"
  $("#product_3").hide()
 else
  console.log "add_product_3 was clicked: #{value}"
  $("#product_3").show()

 value = $("#customer_orders_attributes_0_line_items_attributes_4_product_id").val()
 if value == ''
  console.log "add_product_4 was clicked; but no value"
  $("#product_4").hide()
 else
  console.log "add_product_4 was clicked: #{value}"
  $("#product_4").show()



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
   'customer[orders_attributes][0][paid_amount]': { required: true, digits: true },
   'customer[orders_attributes][0][line_items_attributes][0][product_id]': { required: true },
   'customer[orders_attributes][0][line_items_attributes][0][quantity]': { required: true, digits: true, min: 1 }
  },
  messages: {
   'customer[firstname]': { required: 'Firstname must be alphanumeric.' },
   'customer[lastname]': { required: 'Lastname must be alphanumeric.' },
   'customer[email]': { required: "Email is required.", email: "It should look like an email." },
   'customer[orders_attributes][0][paid_amount]': { required: "A value (like zero) is required.", digits: "It needs to be a number." },
   'customer[orders_attributes][0][line_items_attributes][0][product_id]': { required: "Please select at least one item." },
   'customer[orders_attributes][0][line_items_attributes][0][quantity]': { required: "Number of items is required.", digits: "It must be a number.", min: "Number must be greater than zero." }
  }
 });
