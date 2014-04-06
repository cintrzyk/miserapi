require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

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

    config.action_mailer.default_url_options = { host: Rails.application.secrets.domain }
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:    'smtp.mandrillapp.com',
      port:       587,
      user_name:  Rails.application.secrets.mandrill_username,
      password:   Rails.application.secrets.mandrill_api_key
    }
  end
end
