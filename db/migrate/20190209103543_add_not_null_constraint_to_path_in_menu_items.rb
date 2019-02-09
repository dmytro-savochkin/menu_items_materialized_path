class AddNotNullConstraintToPathInMenuItems < ActiveRecord::Migration
  def up
    change_column :menu_items, :path, :string, null: false
  end

  def down
    change_column :menu_items, :path, :string, null: true
  end
end
