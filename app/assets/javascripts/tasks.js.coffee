# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#$(document).ready -> 
#$->
jQuery ->
 $("#due_date_datepicker").datepicker({ dateFormat: "dd/mm/yy" })
 $("#completed_on_datepicker").datepicker({ dateFormat: "dd/mm/yy" })

 ###
 $('#due_date_datepicker').bind 'click', (event) =>
  console.log '---> tasks.due_date_datepicker 2'
  $("#due_date_datepicker").attr class: 'red_border'
  $("#due_date_datepicker").datepicker()
  console.log '---> tasks.due_date_datepicker 3'
 ###

 $("#new_task_form").bind 'submit', (event) =>
  is_valid_form = $("#new_task_form").valid()
  if is_valid_form
   $('input[type=submit]').attr('disabled', 'disabled')
  else
   $('input[type=submit]').removeAttr('disabled')

 $("#new_task_form").validate(
  rules: {
   'task[title]': { required: true }
  }
 )

 $("#tasks_table").tablesorter(
  sortList: [[0,0]],
  widgets: ['zebra'],
  headers: { 7: { sorter: false }, 8: { sorter: false } }
 )

