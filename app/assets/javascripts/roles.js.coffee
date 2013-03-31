#Role =
# validInfo: (name, description) ->

jQuery ->
 if ($('#new_role_form').length > 0) 
  console.log 'i see new role form'
 else
  console.log 'no new role form'


 $('#footer').bind 'click', (event) => 
  #$('#scratch_space').toggleClass('red_border');
  console.log 'footer clicked'
   

