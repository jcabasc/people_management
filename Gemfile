source 'https://rubygems.org'

ruby '2.2.5'

gem 'rails', '4.2.7.1'

# Database
gem 'mysql2', '~> 0.4.4'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '~> 3.1.0'
end

# Server
gem 'puma', '3.6.0'

# App
gem 'jquery-rails'
gem 'turbolinks'
gem 'resque', require: 'resque/server'
gem 'tomdoc', '~> 0.2.5'

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.7.0'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem "letter_opener", "~> 1.4.1"
  gem 'foreman', '~> 0.82.0'
  gem 'spring'
end

group :test do
  gem 'database_cleaner', '~> 1.5.3'
  gem 'minitest-rails', '~> 2.2.1'
  gem "minitest-red_green"
  gem 'mocha'
  gem 'shoulda', '~> 3.5.0'
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'simplecov', require: false
end
