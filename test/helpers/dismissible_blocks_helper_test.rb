require 'test_helper'

class DismissibleBlocksHelperTest < ActionView::TestCase

  test "render block because not dismissed" do
    def self.current_user; users(:one); end
    assert_not_nil render_dismissible_block('lorem') { 'lorem ipsum' }
  end

  test "omit block because dismissed" do
    def self.current_user; users(:two); end
    assert_nil render_dismissible_block('lorem') { 'lorem ipsum' }
  end

  test "raise exception because content missing" do
    def self.current_user; users(:one); end
    assert_raise DismissibleBlocks::ContentMissing do
      render_dismissible_block('lorem')
    end
  end

  test "raise exception because model unavailable" do
    assert_raise DismissibleBlocks::ModelUnavailable do
      render_dismissible_block('lorem') { 'lorem ipsum' }
    end
  end

  test "raise exception because attribute unavailable" do
    UserNoAttr = Struct.new(:username, :password)
    def self.current_user; UserNoAttr.new; end
    assert_raise DismissibleBlocks::AttributeUnavailable do
      render_dismissible_block('lorem') { 'lorem ipsum' }
    end
  end

  test "raise exception because attribute not array" do
    UserNotArray = Struct.new(:username, :password, :dismissed_blocks)
    def self.current_user; UserNotArray.new; end
    assert_raise DismissibleBlocks::AttributeNotArray do
      render_dismissible_block('lorem') { 'lorem ipsum' }
    end
  end

  test "verify block name added to html5 data attributes" do
    block  = '<div data-dismissible>'
    block += '<span data-dismissible-hide></span>'
    block += '</div>'
    def self.current_user; users(:one); end
    html = render_dismissible_block('lorem') { block.html_safe }
    assert_includes html, "data-dismissible='lorem'"
    assert_includes html, "data-dismissible-hide='lorem'"
  end

  test "does not modify data attributes that already have values" do
    block  = "<div data-dismissible='ipsum'>"
    block += "<span data-dismissible-hide='ipsum'></span>"
    block += "</div>"
    def self.current_user; users(:one); end
    html = render_dismissible_block('lorem') { block.html_safe }
    assert_includes html, "data-dismissible='ipsum'"
    assert_includes html, "data-dismissible-hide='ipsum'"
  end

  test "yields name to the content block" do
    def self.current_user; users(:one); end
    passed_name = nil
    render_dismissible_block('lorem') do |name|
      passed_name = name
      'ipsum'
    end
    assert_equal 'lorem', passed_name
  end

end
