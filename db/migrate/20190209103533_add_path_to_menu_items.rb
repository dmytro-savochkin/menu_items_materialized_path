class AddPathToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :path, :string, null: true
  end
end
