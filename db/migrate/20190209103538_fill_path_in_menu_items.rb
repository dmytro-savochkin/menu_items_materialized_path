class FillPathInMenuItems < ActiveRecord::Migration
  class MenuItem < ApplicationRecord
    belongs_to :parent, class_name: 'MenuItem'
  end

  def up
    # If there are too many items on production we can do this in more batch-like approach, even via Sidekiq if needed.
    # But it depends on the real situation so I'm writing the easiest solution here.
    MenuItem.transaction do
      MenuItem.all.each do |menu_item|
        ids = [menu_item.position]
        current_item = menu_item
        while current_item.parent_id.present?
          current_item = current_item.parent
          ids.push(current_item.position)
        end
        path = ids.reverse.join('.')
        say "updating menu_item #{menu_item.id} to have path #{path}"
        menu_item.update!(path: path)
      end
    end
  end

  def down
    MenuItem.update_all(path: nil)
  end
end
