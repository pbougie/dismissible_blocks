require 'dismissible_blocks/controllers/helpers'
require 'dismissible_blocks/version'

module DismissibleBlocks
  class Engine < ::Rails::Engine
    config.to_prepare do
      ApplicationController.helper(DismissibleBlocksHelper)
      ApplicationController.include(DismissibleBlocks::Controllers::Helpers)
    end
  end
end
