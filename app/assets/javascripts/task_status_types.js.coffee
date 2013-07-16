# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> 

 $("#new_task_status_type_form").bind 'submit', (event) =>
  is_valid_form = $("#new_task_status_type_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')
  
 $("#new_task_status_type_form").validate({
  errorClass: 'red_font',
  rules: {
   'task_status_type[name]': { required: true },
  }
 });
 $("#task_status_types_table").tablesorter({
  sortList: [[0,0]],
  widgets: ['zebra'],
  headers: { 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false } }
 });

