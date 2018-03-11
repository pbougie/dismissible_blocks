class AddDismissedBlocksToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :dismissed_blocks, :text
  end

  def down
    remove_column :users, :dismissed_blocks
  end
end
