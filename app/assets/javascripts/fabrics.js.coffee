# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
 $("#new_price_date_datepicker").datepicker({ dateFormat: "dd/mm/yy" })
 for i in [0..$('.price_record').length-1]
  $("#price_date_datepicker_#{i}").datepicker({ dateFormat: "dd/mm/yy" })
 
 #console.log $('#new_fabric_price_record').attr('style')
 #console.log $('#new_fabric_price_record').children().length
 ###
 if ( $("#fabric_price_record_0").length)
  $("#price_date_datepicker_0").datepicker({ dateFormat: "dd/mm/yy" })
 else
 ###

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

 $("#fabrics_table").tablesorter({
  sortList: [[0,0]],
  widgets: ['zebra'],
  headers: { 4: { sorter: false }, 5: { sorter: false } }
 });
