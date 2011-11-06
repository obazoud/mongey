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
end

Factory.define :payee do |f|
  f.sequence(:name) { |n| "Payee #{n}" }
  f.opening_date 1.month.ago
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
end

Factory.define :payment do |f|
  f.operation_date 1.day.ago
  f.association :user
  f.association :category
end

Factory.define :deposit do |f|
  f.operation_date 1.day.ago
  f.association :user
  f.association :category
end

Factory.define :transaction do |f|
  f.credit 0.0
  f.debit 0.0
  f.association :account
  f.association :category
  f.association :event
end
