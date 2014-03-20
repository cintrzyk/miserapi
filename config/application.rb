require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"

Bundler.require(*Rails.groups)

module MiserApi
  class Application < Rails::Application
    config.time_zone = 'Warsaw'
    config.i18n.default_locale = :en

    config.middleware.insert_before ActionDispatch::ShowExceptions, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :delete, :options]
      end
    end

    Mongoid.raise_not_found_error = false
  end
end
