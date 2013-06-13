# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
 $("#new_price_date_datepicker").datepicker({ dateFormat: "dd/mm/yy" })
 for i in [0..$('.price_record').length-1]
  $("#price_date_datepicker_#{i}").datepicker({ dateFormat: "dd/mm/yy" })
 
 #console.log $('#new_fabric_price_record').attr('style')
 #console.log $('#new_fabric_price_record').children().length

 $("#new_fabric_price").bind 'click', (event) =>
  $("#new_fabric_price_record").toggle()

 Fabric =
  cleanName: (name) ->
   name.replace /[-]/g, ""

  validName: (name) ->
   cleaned_name = @cleanName(name)

 $("#name").blur ->
  new_name = Fabric.validName(@value)
  if new_name
   $("#name").val(new_name)
  else

 $("#new_fabric_form").bind 'submit', (event) =>
  is_valid_form = $("#new_fabric_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 
 if $("#new_fabric_form").length
  $("#new_fabric_form").validate()
  $('#name').rules("add", "required") 
  $('#new_price_date_datepicker').rules("add", "required") 
  count_of_price_records = $('.price_record').length
  for i in [0..count_of_price_records-1]
   $("#fabric_prices_attributes_#{i}_amount").rules("add", "required") 
   if i < count_of_price_records-1
    $("#price_date_datepicker_#{i}").rules("add", "required") 
 

 ###
 $("#new_fabric_form").validate({
  rules: {
   'fabric[name]': { required: true },
   "fabric[prices_attributes][0][date]": { required: true },
   "fabric[prices_attributes][0][amount]": { required: true, min: 0.01, number: true }
  },
  messages: { 
   "fabric[prices_attributes][0][date]": { required: 'Date required.' },
   "fabric[prices_attributes][0][amount]": { required: "Please enter price greater than 1 cent.", min: "Please enter valid price.", number: "Please enter valid price." }
  }
 })
 ###

 ###
 $("#new_fabric_form").validate({
  rules: {
   'fabric[name]': { required: true },
   'fabric[prices_attributes][0][date]': { required: true },
   'fabric[prices_attributes][0][amount]': { required: true, min: 0.01, number: true }
  },
  messages: { 
   'fabric[prices_attributes][0][date]': { required: 'Date required.' },
   'fabric[prices_attributes][0][amount]': { required: "Please enter price greater than 1 cent.", min: "Please enter valid price.", number: "Please enter valid price." }
  }
 });
 ###

 $("#fabrics_table").tablesorter({
  sortList: [[1,0]],
  widgets: ['zebra'],
  headers: { 5: { sorter: false }, 6: { sorter: false } }
 });
