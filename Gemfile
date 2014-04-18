source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.0'

gem 'bcrypt-ruby', '~> 3.1.2'
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'
gem 'bson_ext'
gem 'decent_exposure'
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'
gem 'devise'
gem 'net-ssh', '~> 2.7.0'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'letter_opener'
end

group :development, :test do
  gem 'jazz_hands'
end

group :production do
  gem 'unicorn'
end
