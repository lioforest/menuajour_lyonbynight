class ItemType < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :menu_items, dependent: :destroy

  has_many :type_item_category_links, dependent: :destroy
  has_many :category_types, through: :type_item_category_links

################################################
################## Methods #####################
################################################

#***************** Public *********************#

  def add_category_type(_category_type)
    self.category_types.append(_category_type)
  end

end
