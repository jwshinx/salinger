jQuery ->

 $('#footer').bind 'click', (event) => 
  #$('#scratch_space').toggleClass('red_border');
  isPresent($('#new_role_form'))
  #console.log $('#sienna_img').attr('src')
  current_jpg = $('#sienna_img').attr('src')
  x = String(current_jpg.match(/[\d]/))
  if x == '1'
   $('#sienna_img').attr('src', "assets/toyota/sienna_2.jpg")
  else if x == '2'
   $('#sienna_img').attr('src', "assets/toyota/sienna_3.jpg")
  else if x == '3'
   $('#sienna_img').attr('src', "assets/toyota/sienna_4.jpg")
  else if x == '4'
   $('#sienna_img').attr('src', "assets/toyota/sienna_5.jpg")
  else if x == '5'
   $('#sienna_img').attr('src', "assets/toyota/sienna_6.jpg")
  else 
   $('#sienna_img').attr('src', "assets/toyota/sienna_1.jpg")

   #$('#sienna_img').attr('src', "assets/toyota/sienna_" + counter + ".jpg")
   
isPresent = (element) ->
 if (element.length > 0) 
  console.log 'is present!'
 else 
  console.log 'is not present!'
