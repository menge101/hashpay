source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.1.6'
gem 'pg'
gem 'stripe'
gem 'geocoder'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'sass-rails'

group :development do
 gem 'spring'
end

group :test do
 gem 'capybara'
 gem 'poltergeist'
 gem 'selenium-webdriver'
 gem 'cucumber'
 gem 'rspec'
 gem 'cucumber-rails', :require => false
 gem 'database_cleaner'
 gem 'site_prism'
 gem 'faker'
 gem 'anticipate'
end

group :development, :test do
 gem 'ruby-debug-ide', require: false
 gem 'factory_girl_rails'
end

group :production do
 gem 'puma'
 gem 'rack-timeout'
 gem 'foreman'
end

