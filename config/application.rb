require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManagerBackend
  class Application < Rails::Application
    # ...
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # Change to your frontend URL in production
        resource '*',
          headers: :any,
          methods: [:get, :post, :options]
      end
    end
  end
end
