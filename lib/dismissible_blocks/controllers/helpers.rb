module DismissibleBlocks
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :dismissible_blocks_controller?
      end

      private

        def dismissible_blocks_controller?
          controller_path == 'dismissible_blocks'
        end
    end
  end
end
