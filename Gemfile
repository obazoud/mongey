source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'bson_ext'
gem 'therubyracer'
gem 'redis'
gem 'redis-namespace'

gem 'mongoid_money', :git => 'git://github.com/pubis/mongoid_money', :branch => "make_currency_independent"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "bcrypt-ruby", :require => "bcrypt"

# To use debugger
gem 'ruby-debug19', :require => 'ruby-debug'

gem 'rspec-rails', :group => [:test, :development]
group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'spork', '~> 0.9.0.rc'
  gem 'guard-spork'
  gem 'mongoid-rspec'
  gem 'growl'
end
