require 'application_system_test_case'

class DismissibleBlocksTest < ApplicationSystemTestCase

  test "two blocks are displayed; one is dismissed" do
    login users(:one)
    page.assert_selector('[data-dismissible=lorem]', count: 1)
    page.assert_selector('[data-dismissible=ipsum]', count: 1)
    first('[data-dismissible-hide]').click
    page.assert_selector('[data-dismissible=lorem]', count: 0)
    page.assert_selector('[data-dismissible=ipsum]', count: 1)
    logout
  end

  test "two blocks are displayed; both dismissed" do
    login users(:one)
    page.assert_selector('[data-dismissible]', count: 2)
    first('[data-dismissible-hide]').click
    first('[data-dismissible-hide]').click
    page.assert_no_selector('[data-dismissible]')
    logout
  end

  test "blocks are not displayed; already dismissed" do
    login users(:two)
    page.assert_no_selector('[data-dismissible]')
    logout
  end

end
