class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.boolean :is_category, null: false
      t.integer :position, null: false
      t.integer :parent_id
    end
  end
end
