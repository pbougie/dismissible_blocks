require 'application_system_test_case'

class DismissibleBlocksTest < ApplicationSystemTestCase

  test "block is displayed and dismissed" do
    login users(:one)
    assert page.has_selector? '.block'
    click_on 'Hide'
    assert page.has_no_selector? '.block'
    logout
  end

  test "block is not displayed; already dismissed" do
    login users(:two)
    assert page.has_no_selector? '.block'
    logout
  end

end
