class AddIndexToPathInMenuItems < ActiveRecord::Migration
  def change
    add_index :menu_items, :path
  end
end
