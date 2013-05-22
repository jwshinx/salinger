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

 $("#new_order_form").bind 'submit', (event) =>
  is_valid_form = $("#new_order_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#new_order_form").validate({
  rules: {
   'customer[firstname]': { required: true },
   'customer[lastname]': { required: true },
   'customer[email]': { required: true, email: true },
   'customer[orders_attributes][0][paid_amount]': { required: true, digits: true }
  },
  messages: {
   'customer[firstname]': { required: 'Firstname must be alphanumeric.' },
   'customer[lastname]': { required: 'Lastname must be alphanumeric.' },
   'customer[email]': { required: "Email is required.", email: "It should look like an email." },
   'customer[orders_attributes][0][paid_amount]': { required: "A value (like zero) is required.", digits: "It needs to be a number." }
  }
 });
