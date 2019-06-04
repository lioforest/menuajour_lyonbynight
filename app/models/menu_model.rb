class MenuModel < ApplicationRecord
  belongs_to :user
  has_many :model_category_links
  has_many :categories, source: :menu_category, class_name: "MenuCategory", through: :model_category_links

  has_many :item_category_links, through: :categories
  has_many :items, source: :menu_item, class_name: "MenuItem", through: :item_category_links
end
