# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
 $("#order_line_items_table").tablesorter(
  sortList: [[0,1], [1,0]],
  widgets: ['zebra'],
  headers: { 10: { sorter: false }, 11: { sorter: false }, 12: { sorter: false }}
 )
