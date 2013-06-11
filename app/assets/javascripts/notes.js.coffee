# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 $("#notes_table").tablesorter({
  sortList: [[0,0]],
  widgets: ['zebra'],
  #headers: { 5: { sorter: false }, 6: { sorter: false }, 7: { sorter: false } }
 })
