Factory.define :user do |f|
  f.sequence(:username) { |n| "john#{n}"}
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "john#{n}@example.com" }
end

