ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  self.fixture_path = File.expand_path('../fixtures', __FILE__)
  self.fixtures :all
end

class ActionDispatch::IntegrationTest
  self.fixture_path = File.expand_path('../fixtures', __FILE__)
end
