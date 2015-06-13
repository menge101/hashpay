source 'https://rubygems.org'
ruby '2.2.0'

gem 'sinatra'
gem 'stripe'
gem 'require_all'
gem 'sinatra-activerecord'
gem 'rake'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'rack-ssl'
  gem 'pg'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
end

