class ModelCategoryLink < ApplicationRecord
  belongs_to :menu_category
  belongs_to :menu_model
end
