require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)
require 'dismissible_blocks'

module Dummy
  class Unauthorized < StandardError; end
  class Application < Rails::Application; end
end
