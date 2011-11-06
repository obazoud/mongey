module CurrenciesHelper
  def format_currency(value, currency)
    return "0.00" if value.nil?
    return currency.format(value) unless currency.nil?
    '%.2f' % value
  end
end
