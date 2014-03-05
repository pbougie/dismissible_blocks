require 'test_helper'
require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def login(user)
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'
    assert current_path == landing_path
    assert page.has_content? 'You have been logged in.'
  end

  def logout
    visit logout_path
    assert current_path == login_path
    assert page.has_content? 'You have been logged out.'
  end
end

# Prevent database locks when testing AJAX features
# https://github.com/jnicklas/capybara#transactions-and-database-setup
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
