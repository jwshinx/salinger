$(document).ready ->
 $("#users_table").tablesorter({
  sortList: [[0,0], [1,0]],
  widgets: ['zebra'],
  headers: { 4: { sorter: false }, 5: { sorter: false }, 6: { sorter: false } }
 });
