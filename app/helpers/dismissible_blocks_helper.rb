module DismissibleBlocksHelper
  def render_dismissible_block(name, &block)
    unless dismissed?(name)
      if block_given?
        contents = capture(&block)
        add_block_name_to_attributes(contents, name)
      else
        raise DismissibleBlocks::ContentMissing
      end
    end
  end

  private

    def dismissed?(name)
      if respond_to?(:current_user)
        if !current_user.respond_to?(:dismissed_blocks)
          raise DismissibleBlocks::AttributeUnavailable
        elsif !current_user.dismissed_blocks.is_a?(Array)
          raise DismissibleBlocks::AttributeNotArray
        else
          current_user.dismissed_blocks.include?(name)
        end
      else
        raise DismissibleBlocks::ModelUnavailable
      end
    end

    def add_block_name_to_attributes(contents, name)
      contents.gsub! /(data-dismissible)(-hide)?(?!-)/, "\\1\\2='#{name}'"
      contents.html_safe
    end
end
