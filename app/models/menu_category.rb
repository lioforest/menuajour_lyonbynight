class MenuCategory < ApplicationRecord
  belongs_to :user
  has_many :item_category_links
  has_many :model_category_links
  has_many :items, source: :menu_item, class_name: "MenuItem", through: :item_category_links
  has_many :models, source: :menu_model, class_name: "MenuModel", through: :model_category_links
end
