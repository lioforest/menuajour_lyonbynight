class MenuItem < ApplicationRecord
  has_many :item_category_links
  has_many :menu_categories, through: :item_category_links
  has_many :menu_models, through: :menu_categories
end
