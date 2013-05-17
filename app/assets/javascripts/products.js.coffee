# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> 
 Product = 
  cleanName: (name) ->
   name.replace /[-]/g, ""
   
  validName: (name) ->
   cleaned_name = @cleanName(name)
   #for i in [(cleaned_name.length-1)..0]

 $("#name").blur ->
  new_name = Product.validName(@value) 
  if new_name
   $("#name").val(new_name)
  else

 $("#new_product_form").bind 'submit', (event) =>
  is_valid_form = $("#new_product_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')
  
 #$("#product_form_button").bind 'click', (event) =>

 $("#new_product_form").validate({
  rules: {
   'product[name]': { required: true },
   'product[description]': { required: true },
   'product[price]': { required: true, min: 1 },
   'product[count]': { required: true, digits: true },
   'product[sewings_attributes][0][fabric_id]': { required: true }
  },
  messages: {
   'product[price]': { min: "Please a valid dollar amount." },
   'product[sewings_attributes][0][fabric_id]': { required: "Please select at least one fabric." }
  }
 });

