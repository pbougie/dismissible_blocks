require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

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
