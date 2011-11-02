Factory.define :account do |f|
  f.sequence(:name) { |n| "Account #{n}"}
  f.opening_date 1.year.ago
end

