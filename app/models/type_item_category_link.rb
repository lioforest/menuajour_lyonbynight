class TypeItemCategoryLink < ApplicationRecord
  belongs_to :item_type
  belongs_to :category_type
end
