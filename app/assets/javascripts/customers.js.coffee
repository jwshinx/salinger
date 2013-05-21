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

 $("#new_customer_form").bind 'submit', (event) =>
  is_valid_form = $("#new_customer_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#new_customer_form").validate({
  rules: {
   'customer[firstname]': { required: true },
   'customer[lastname]': { required: true },
   'customer[email]': { required: true, email: true }
  },
  messages: {
   'customer[firstname]': { required: 'Firstname must be alphanumeric.' },
   'customer[lastname]': { required: 'Lastname must be alphanumeric.' },
   'customer[email]': { required: "Email is required.", email: "It should look like an email." }
  }
 });
