require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoommateBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Don't generate factories.
    config.generators.factory_bot = false

    # Use UUIDs for IDs.
    # https://lab.io/articles/2017/04/13/uuids-rails-5-1/
    config.generators.orm :active_record, primary_key_type: :uuid

    # Auto-load GraphQL mutations.
    config.autoload_paths << Rails.root.join('app/graphql/mutations')

    config.asset_host = 'http://localhost:3000'
  end
end
