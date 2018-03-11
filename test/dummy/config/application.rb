require_relative 'boot'

require 'rails/all'
require 'dismissible_blocks'

Bundler.require(*Rails.groups)

module Dummy
  class Unauthorized < StandardError; end

  class Application < Rails::Application
    config.load_defaults 5.1
  end
end
