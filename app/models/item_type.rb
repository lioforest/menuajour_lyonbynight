class ItemType < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

  has_many :menu_items, dependent: :destroy

  has_many :type_item_category_links, dependent: :destroy
  has_many :category_types, through: :type_item_category_links

end
