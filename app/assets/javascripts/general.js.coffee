$(document).ready ->
 $('#logo').append("<img id='logo_unido' src='/assets/logo_unido.gif'/>");
 $('#footer').attr class: 'red_border'
 $('#logo').bind 'click', (event) =>
  $('#footer').toggleClass('white_background');
  #$('#footer').hide();
 $('#masthead').bind 'click', (event) =>
  alert('thats the masthead');
