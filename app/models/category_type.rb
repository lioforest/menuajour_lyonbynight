class CategoryType < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :user

  has_many :type_item_category_links, dependent: :destroy
  has_many :item_types, through: :type_item_category_links

end
