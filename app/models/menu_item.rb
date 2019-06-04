class MenuItem < ApplicationRecord
  belongs_to :user
  has_many :item_category_links
  has_many :categories, source: :menu_category, class_name: "MenuCategory", through: :item_category_links
  has_many :models, source: :menu_model, class_name: "MenuModel", through: :menu_categories
end
