class MenuModel < ApplicationRecord
  belongs_to :user
  has_many :model_category_links
  has_many :menu_categories, through: :model_category_links
  has_many :menu_items, through: :menu_categories
end
