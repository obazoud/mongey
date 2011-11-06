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

Factory.define :user do |f|
  f.sequence(:username) { |n| "john#{n}"}
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "john#{n}@example.com" }
end

