# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Currency.create(:code => 'SEK', :prefix => '',  :suffix => ' kr', :decimal_point => ",", :thousand_separator => ' ')
Currency.create(:code => 'USD', :prefix => '$ ', :suffix => '',   :decimal_point => ".", :thousand_separator => '\'')