source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.1'

gem 'bcrypt-ruby', '~> 3.1.2'
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'
gem 'bson_ext'
gem 'decent_exposure'
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'
gem 'devise'
gem 'net-ssh', '~> 2.7.0'
gem 'capistrano'
gem 'capistrano-rails'
gem 'capistrano-rbenv', '~> 2.0'

group :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'simplecov', '0.7.1', require: false
  gem 'coveralls', require: false
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'jazz_hands'
end

group :production do
  gem 'unicorn'
end
