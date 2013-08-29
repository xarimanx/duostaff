source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'mysql2'
gem 'pdfkit'
gem 'wkhtmltopdf-binary'
gem 'haml'
gem 'unicorn'
gem 'newrelic_rpm'
gem 'whenever', :require => false
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'dalli'

group :assets do
  gem 'sass-rails'
  gem 'uglifier'
  gem 'coffee-rails'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano', :require => false
  gem 'soprano', :require => false
  gem 'brakeman', :require => false
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'email_spec'
  gem "capybara-webkit"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
