$(document).ready ->
  $('#payment_payee_name').autocomplete({source: "/payees/autocomplete"})
