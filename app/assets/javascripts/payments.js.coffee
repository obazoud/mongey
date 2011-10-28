$(document).ready ->
  $('#payment_payee').autocomplete({source: "/payees/autocomplete"})

