#Role =
# validInfo: (name, description) ->

jQuery ->
 #if isPresent($('#new_role_form'))
 if ($('#new_role_form').length > 0)
  console.log 'i see new role form'
 else
  console.log 'no new role form'


 $('#footer').bind 'click', (event) => 
  #$('#scratch_space').toggleClass('red_border');
  console.log 'footer clicked'
  isPresent()
   
isPresent = ->
 console.log 'is present!'
#function isPresent(element) 
#isPresent: ->
# if (element.length > 0) 
#  return true
# else
#  return false 
