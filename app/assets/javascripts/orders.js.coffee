# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
 $("#orders_table").tablesorter({
  sortList: [[0,1], [1,0]],
  widgets: ['zebra'],
  headers: { 3: { sorter: false }, 8: { sorter: false }, 9: { sorter: false }}
 });
