require 'test_helper'

class DismissibleBlocksControllerTest < ActionController::TestCase

  test "dismiss block via ajax" do
    session[:username] = users(:one).username # Login
    refute users(:one).dismissed_blocks.include?('lorem')
    xhr :post, :create, block: 'lorem', format: 'json'
    users(:one).reload
    assert users(:one).dismissed_blocks.include?('lorem')
    assert_response :ok
  end

  test "dismiss block fails via ajax; not logged in" do
    xhr :post, :create, block: 'lorem', format: 'json'
    assert_response :unprocessable_entity
  end
end
