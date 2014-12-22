require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)
require 'dismissible_blocks'

module Dummy
  class Unauthorized < StandardError; end

  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
