# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Gifrap
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    config.generators do |g|
      g.factory_bot dir: 'spec/factories'
      g.helper false
      g.orm :active_record, primary_key_type: :uuid
      g.request_specs false
      g.routing_specs false
      g.test_framework :rspec
      g.view_specs false
    end

    config.active_job.queue_adapter = :good_job

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
