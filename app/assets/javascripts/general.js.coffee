jQuery ->
 $('#logo').append("<img id='logo_unido' src='/assets/logo_unido.gif'/>");

 $('#footer').attr class: 'red_border'

 $('#logo').bind 'click', (event) =>
  $('#footer').toggleClass('white_background');
  $('#scratch_space').children().children().css('background-color', 'red');

 $('#masthead').bind 'click', (event) =>
  #alert('thats the masthead');

