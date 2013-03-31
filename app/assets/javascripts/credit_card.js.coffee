CreditCard = 
  number_of_digits: (number) -> 
    number.length+1
  cleanNumber: (number) -> 
    number.replace /[- ]/g, ""
  validNumber: (number) -> 
    total = 0
    number = @cleanNumber(number)
    for i in [(number.length-1)..0]
      #console.log('i = ' + i)
      n = +number[i]
      if (i+number.length) % 2 == 0
        n = if n*2 > 9 then n*2 - 9 else n*2
      total += n
    total % 10 == 0

jQuery ->
  $("#card_number").blur ->
    card_number = this.value
    if (CreditCard.validNumber(card_number))
      $("#credit_card_number_error").text("")
    else
      $("#credit_card_number_error").text("Invalid credit card number: " + card_number + ".")

  $("#card_number").keypress ->
    $("#credit_card_number_error").text("Number of digits: " + CreditCard.number_of_digits(this.value))
