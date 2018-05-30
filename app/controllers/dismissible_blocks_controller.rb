class DismissibleBlocksController < ApplicationController
  def create
    if current_user_available?
      unless current_user.dismissed_blocks.include?(block)
        current_user.dismissed_blocks.push(block)
        current_user.save!
      end
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def current_user_available?
      current_user && current_user.try(:dismissed_blocks)
    end

    def block
      params[:block].to_s
    end
end
