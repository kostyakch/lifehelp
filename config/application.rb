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
  end
end
