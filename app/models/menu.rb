class Menu < ApplicationRecord
  validates :name, presence: true
  validate :name_uniqueness_in_user

  belongs_to :user
  has_many :menu_categories, dependent: :destroy
  has_many :menu_items, through: :menu_categories




################################################
################## Methods #####################
################################################

#***************** Public *********************#

def categories
  self.menu_categories.order(:order)
end

def category_by_id(_category_id)
  self.menu_categories.find(_category_id)
end

def item_by_id(_item_id)
 self.menu_items.find(_item_id)
end

def add_category(_category_type)
  MenuCategory.create(menu: self, category_type: _category_type, order: 0)
end

def add_category_by_id(_category_type_id)
  category_type = CategoryType.where(id: _category_type_id).first
  MenuCategory.create(menu: self, category_type: category_type, order: 0)
end

def add_category_by_name(_category_type_name)
  category_type = CategoryType.where(name: _category_type_name).first
  MenuCategory.create(menu: self, category_type: category_type, order: 0)
end

def delete_category_by_id(_category_id)
  self.menu_categories.find(_category_id).destroy
end

def delete_item_by_id(_item_id)
  self.menu_items.find(_item_id).destroy
end

#***************** Custom Validators *********************#

def name_uniqueness_in_user
  menu_names =[]
  Menu.where(user: self.user).each {|_menu|
    menu_names.append(_menu.name) if _menu != self
  }
  if menu_names.include?(self.name)
    error_message = "Menu.name (here #{self.name}) must be unique for one user"
    errors.add(:name, error_message)
  end
end

end
