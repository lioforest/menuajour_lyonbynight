class CategoryType < ApplicationRecord
  validates :name, presence: true
  validate :name_uniqueness_in_user

  belongs_to :user

  has_many :menu_categories, dependent: :destroy
  has_many :type_item_category_links, dependent: :destroy
  has_many :item_types, through: :type_item_category_links
  has_many :menu_categories, dependent: :destroy

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

def add_item_type_by_id(_item_type_id)
  self.item_types.append(ItemType.find(_item_type_id))
end

def remove_item_type_by_id(_item_type_id)
  self.item_types.delete(ItemType.find(_item_type_id))
end

#***************** Custom Validators *********************#

def name_uniqueness_in_user
  category_type_names =[]
  CategoryType.where(user: self.user).each {|_category_type|
    category_type_names.append(_category_type.name) if _category_type != self
  }
  if category_type_names.include?(self.name)
    error_message = "CategoryType.name (here #{self.name}) must be unique for one user"
    errors.add(:name, error_message)
  end
end

end
