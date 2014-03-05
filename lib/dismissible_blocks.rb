require 'dismissible_blocks/engine'

module DismissibleBlocks
  extend ActiveSupport::Autoload

  class ModelUnavailable < StandardError; end
  class AttributeUnavailable < StandardError; end
  class AttributeNotArray < StandardError; end
  class ContentMissing < StandardError; end

  autoload :Controller
  autoload :Helper
end
