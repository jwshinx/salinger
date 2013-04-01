jQuery ->
 $('#footer').bind 'click', (event) => 
  #$('#scratch_space').toggleClass('red_border');
  console.log 'footer clicked'
  isPresent($('#new_role_form'))
   
isPresent = (element) ->
 if (element.length > 0) 
  console.log 'is present!'
 else
  console.log 'is not present!'
