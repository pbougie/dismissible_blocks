require 'dismissible_blocks/engine'

module DismissibleBlocks
  class ModelUnavailable < StandardError; end
  class AttributeUnavailable < StandardError; end
  class AttributeNotArray < StandardError; end
  class ContentMissing < StandardError; end
end
