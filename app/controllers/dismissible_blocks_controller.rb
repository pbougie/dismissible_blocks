class DismissibleBlocksController < ApplicationController
  def create
    if current_user_available
      current_user.dismissed_blocks += [ params[:block].to_s ]
      current_user.save!
      render :json => {}, :status => :ok
    else
      render :json => {}, :status => :unprocessable_entity
    end
  end

  private

    def current_user_available
      respond_to?(:current_user) && current_user.respond_to?(:dismissed_blocks)
    end
end
