source 'https://rubygems.org'
ruby '2.2.3'

# Project requirements
gem 'rake'
gem 'oj'

# Component requirements
gem 'sass'
gem 'haml'
gem 'mongoid', '~>4.0.0'
gem 'dotenv'
gem 'bcrypt'

# Tracking
gem 'mixpanel-ruby'
gem 'analytics-ruby', '~> 2.0.0', require: 'segment/analytics'

# Test requirements
group :test do
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'factory_girl'
  gem 'fuubar'
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler', require: false
  gem 'guard-rubocop'
  gem 'mongoid-rspec', '~> 2.1.0'
  gem 'pry'
  gem 'rack-test', require: 'rack/test'
end

# Development requirements
group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Padrino Stable Gem
gem 'padrino', '0.12.5'
gem 'puma'
gem 'rabl'
