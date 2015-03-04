ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'minitest/pride'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
ActiveSupport::TestCase.fixtures :all
