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

 value = $("#product_sewings_attributes_1_fabric_id").val()
 if value == ''
  console.log "add_fabric_1 was clicked; but no value"
  $("#fabric_1").hide()
 else
  console.log "add_fabric_1 was clicked: #{value}" 
  $("#fabric_1").show()
 value = $("#product_sewings_attributes_2_fabric_id").val()
 if value == ''
  console.log "add_fabric_2 was clicked; but no value"
  $("#fabric_2").hide()
 else
  console.log "add_fabric_2 was clicked: #{value}" 
  $("#fabric_2").show()

 $("#additional_fabric_0").bind 'click', (event) =>
  $("#fabric_1").show()
 $("#additional_fabric_1").bind 'click', (event) =>
  $("#fabric_2").show()

 $("#new_product_form").bind 'submit', (event) =>
  is_valid_form = $("#new_product_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')
  
 #$("#product_form_button").bind 'click', (event) =>

 $("#new_product_form").validate({   
  errorClass: 'red_font',
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
 $("#products_table").tablesorter({
  sortList: [[1,0]],
  widgets: ['zebra'],
  headers: { 8: { sorter: false }, 9: { sorter: false } }
 });

