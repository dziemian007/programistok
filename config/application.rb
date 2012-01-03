require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Programistok
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Warsaw'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
		config.assets.precompile += ['custom.css', 'jqueryui.css', 'jquery-ui.js', 'bootstrap-dropdown.js']

		config.i18n.default_locale = :pl

    config.active_record.observers = [:topic_observer,:story_observer]

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'amberbit.com',
      user_name:            'amberbit_www@amberbit.com',
      password:             'dVRYUY3QzJQrwD',
      authentication:       'plain',
      enable_starttls_auto: true
    }
  end

  Twitter.configure do |config|
    config.consumer_key = "d0cBwm8xz8xaDcl6UmQQ"
    config.consumer_secret = "slMtX83BBkncJ2PilzYjvEhYdtqVYggzZhVXGT8Ac"
    config.oauth_token = "450629388-dHkETGzc2AxWiQWABCGTlIPH8zxpszPFlBAI1CZq"
    config.oauth_token_secret = "IXBsgYXtra05zzbU8S7Bm8OniMZN17K1s9MIsoX2w"
  end

end
