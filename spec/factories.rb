Factory.define :category do |f|
  f.name "A Category"
end

Factory.define :currency do |f|
  f.sequence(:code) { |n| "CC#{n}" }
end

Factory.define :complete_currency, :parent => :currency do |f|
  f.prefix "pr"
  f.suffix "sx"
  f.thousand_separator "'"
  f.decimal_point "."
end

Factory.define :account do |f|
  f.sequence(:name) { |n| "Account #{n}" }
  f.opening_date 1.year.ago
  f.initial_balance 123.45
end

Factory.define :payee, :class => Payee, :parent => :account do |f|
  f.sequence(:name) { |n| "Payee #{n}" }
end

Factory.define :user do |f|
  f.sequence(:username) { |n| "john#{n}"}
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "john#{n}@example.com" }
  f.association :currency
end

Factory.define :event do |f|
  f.operation_date 1.day.ago
  f.association :user
  f.amount 1234.50
end

Factory.define :payment, :class => Payment, :parent => :event do |f|
  f.association :category
end

Factory.define :deposit, :class => Deposit, :parent => :event do |f|
  f.association :category
end

Factory.define :transaction do |f|
  f.credit_amount 0.0
  f.debit_amount 0.0
  f.operation_date 1.day.ago
  f.association :account
  f.association :category
  f.association :event
end
