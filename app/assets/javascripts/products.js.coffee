# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> 
 $("#new_product_form").bind 'submit', (event) =>
  console.log "submit..2"
  #$('input[type=submit]').attr('disabled', 'disabled')
  #console.log "submit..2a #{event.target.nodeName} #{event.target} #{event.data} #{event.isDefaultPrevented()} #{event.result} #{event.isPropagationStopped()}"

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

