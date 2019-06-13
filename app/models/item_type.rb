class ItemType < ApplicationRecord
  validates :name, presence: true
  validate :name_uniqueness_in_user

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

def name_and_price
  "#{self.name} - #{self.price}€"
end

#***************** Custom Validators *********************#

def name_uniqueness_in_user
  item_type_names =[]
  ItemType.where(user: self.user).each {|_item_type|
    item_type_names.append(_item_type.name) if _item_type != self
  }
  if item_type_names.include?(self.name)
    error_message = "ItemType.name (here #{self.name}) must be unique for one user"
    errors.add(:name, error_message)
  end
end
end
