class ItemCategoryLink < ApplicationRecord
  belongs_to :menu_item
  belongs_to :menu_category
end
