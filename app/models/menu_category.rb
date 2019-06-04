class MenuCategory < ApplicationRecord
  has_many :item_category_links
  has_many :model_category_links
  has_many :menu_items, through: :item_category_links
  has_many :menu_models, through: :model_category_links
end
