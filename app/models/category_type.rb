class CategoryType < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :user

  has_many :type_item_category_links, dependent: :destroy
  has_many :item_types, through: :type_item_category_links

################################################
################## Methods #####################
################################################

#***************** Public *********************#

def create_new_item_type(_name, _description, _price)
 item_type = ItemType.create(name: _name, description: _description, price: _price, user: self.user)
 item_type.category_types.append(self)
end

def add_item_type(_item_type)
  self.item_types.append(_item_type)
end

end
