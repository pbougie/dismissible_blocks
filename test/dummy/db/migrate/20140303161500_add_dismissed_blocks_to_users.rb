class AddDismissedBlocksToUsers < ActiveRecord::Migration
  def up
    add_column :users, :dismissed_blocks, :text
  end

  def down
    remove_column :users, :dismissed_blocks
  end
end
