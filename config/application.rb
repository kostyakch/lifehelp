require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lifehelp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # I18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :ru
    config.i18n.available_locales = %i[ru]

    config.time_zone = 'Europe/Moscow'

    # Generators
    config.generators do |generator|
      # Add "id: :uuid, default: -> { 'uuid_generate_v4()' }" to 'create_table' in migrations
      generator.orm :active_record, primary_key_type: 'uuid, default: -> { \'uuid_generate_v4()\' }'
      # generator.template_engine :slim
      # Disable automated generation of scaffold.css.scss. May affect other generators
      generator.stylesheets false
      generator.javascripts false
      generator.helper false
      generator.resource_controller :responders_controller
    end

    config.eager_load_paths << Rails.root.join('lib')
  end
end
