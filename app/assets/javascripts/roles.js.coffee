jQuery ->
 console.log 'preload start'
 #preLoadImages("assets/toyota/sienna_4.jpg");
 preLoadImages('abc', 'def', 'ghi')
 console.log 'preload end'
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
  #else if x == '3'
  # $('#sienna_img').attr('src', "assets/toyota/sienna_4.jpg")
  #else if x == '4'
  # $('#sienna_img').attr('src', "assets/toyota/sienna_5.jpg")
  #else if x == '5'
  # $('#sienna_img').attr('src', "assets/toyota/sienna_6.jpg")
  else 
   $('#sienna_img').attr('src', "assets/toyota/sienna_1.jpg")

   #$('#sienna_img').attr('src', "assets/toyota/sienna_" + counter + ".jpg")
   
preLoadImages = ($) -> 
 console.log $ 
 console.log arguments.length 
 for i in [(arguments.length-1)..0]
  console.log '---> ' + i 
  console.log arguments[i] 
# args_len = arguments.length
# for i in [(arg_len-1)..0]
#  cacheImage = document.createElement('img')
#  cacheImage.src = arguments[i]
#  cache.push(cacheImage)

isPresent = (element) ->
 if (element.length > 0) 
  console.log 'is present!'
 else 
  console.log 'is not present!'

#(function($) {
# var cache = [];
# # Arguments are image paths relative to the current page.
# $.preLoadImages = function() {
#  var args_len = arguments.length;
#  for (var i = args_len; i--;) {
#   var cacheImage = document.createElement('img');
#   cacheImage.src = arguments[i];
#   cache.push(cacheImage);
#  }
# }
#})(jQuery);
