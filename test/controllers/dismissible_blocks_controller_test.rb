require 'test_helper'

class DismissibleBlocksControllerTest < ActionDispatch::IntegrationTest

  test "dismiss block via ajax" do
    post login_url, params: {
      username: users(:one).username,
      password: users(:one).password
    }
    assert_response :redirect
    assert_redirected_to landing_url
    refute users(:one).dismissed_blocks.include?('lorem')

    post dismissible_blocks_url(format: :json),
      params: { block: 'lorem' },
      xhr: true
    users(:one).reload
    assert users(:one).dismissed_blocks.include?('lorem')
    assert_response :ok
  end

  test "dismiss block fails via ajax; not logged in" do
    post dismissible_blocks_url(format: :json),
      params: { block: 'lorem' },
      xhr: true
    assert_response :unprocessable_entity
  end

end
