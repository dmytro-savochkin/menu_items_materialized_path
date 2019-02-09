class MenuItem < ApplicationRecord
  belongs_to :parent, class_name: 'MenuItem'
  has_many :children, class_name: 'MenuItem', foreign_key: 'parent_id'

  scope :not_categories, -> { where(is_category: false) }
  scope :previous, -> (current) { where('path < ?', current.path).order(:path) }
end
