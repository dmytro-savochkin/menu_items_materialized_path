class FillMenuItems < ActiveRecord::Migration
  class MenuItem < ApplicationRecord; end

  def up
    menu_items_rows = [
      {id: 4324, is_category: false, position: 1, parent_id: nil},
      {id: 54235, is_category: true, position: 2, parent_id: nil},
      {id: 431234, is_category: false, position: 1, parent_id: 54235},
      {id: 434, is_category: false, position: 2, parent_id: 54235},
      {id: 5432532, is_category: true, position: 3, parent_id: 54235},
      {id: 897, is_category: false, position: 1, parent_id: 5432532},
      {id: 780, is_category: false, position: 2, parent_id: 5432532},
      {id: 4312, is_category: true, position: 4, parent_id: 54235},
      {id: 545, is_category: false, position: 1, parent_id: 4312},
      {id: 5453, is_category: true, position: 2, parent_id: 4312},
      {id: 345345, is_category: false, position: 1, parent_id: 5453},
      {id: 111, is_category: true, position: 5, parent_id: 54235},
      {id: 222, is_category: false, position: 1, parent_id: 111},
      {id: 333, is_category: false, position: 2, parent_id: 111},
      {id: 444, is_category: false, position: 3, parent_id: 111},
      {id: 5436, is_category: false, position: 3, parent_id: nil},
      {id: 54326, is_category: false, position: 4, parent_id: nil},
      {id: 43252, is_category: true, position: 5, parent_id: nil},
      {id: 5432, is_category: false, position: 1, parent_id: 43252},
      {id: 5433, is_category: false, position: 2, parent_id: 43252},
      {id: 54, is_category: false, position: 6, parent_id: nil},
    ]
    menu_items_rows.each do |menu_items_row|
      MenuItem.create!(id: menu_items_row[:id],
                       is_category: menu_items_row[:is_category],
                       position: menu_items_row[:position],
                       parent_id: menu_items_row[:parent_id])
    end
  end

  def down
    MenuItem.delete_all
  end
end
