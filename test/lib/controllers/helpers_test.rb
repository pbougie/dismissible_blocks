require 'test_helper'

class DismissibleBlocks::Controllers::HelpersTest < ActionController::TestCase

  test "should be DismissibleBlocksController" do
    controller = DismissibleBlocksController.new
    assert controller.send(:dismissible_blocks_controller?)
  end

  test "should not be DismissibleBlocksController" do
    controller = SessionsController.new
    refute controller.send(:dismissible_blocks_controller?)
  end
end
