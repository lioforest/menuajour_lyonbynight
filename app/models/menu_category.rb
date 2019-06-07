class MenuCategory < ApplicationRecord
  validates :order, presence: true
  validate :order_uniqueness_in_menu

  before_validation :set_initial_order, on: :create



  belongs_to :menu
  belongs_to :category_type

  has_many :menu_items, dependent: :destroy




################################################
################## Methods #####################
################################################

#***************** Public *********************#

def name
  self.category_type.name
end

def items
 self.menu_items.order(:order)
end

def add_item(_item_type)
  MenuItem.create(item_type: _item_type, menu_category: self, order: 0)
end

def add_item_by_name(_item_type_name)
  MenuItem.create(menu_category: self, item_type: ItemType.where(name: _item_type_name)[0], order: 0)
end

def move_up
  if !is_first_of_menu?
    previous_menu_category = get_previous_menu_category
  end
  puts previous_menu_category[0].id
end

#***************** Private *********************#

private

def get_highest_order_in_menu
  highest_order = -1
  MenuCategory.where(menu: self.menu).each {|_menu_category|
    _menu_category_order = _menu_category.order
    if _menu_category_order >= highest_order
      highest_order= _menu_category_order
    end
  }
  highest_order
end

def get_smallest_order_in_menu
  smallest_order = get_highest_order_in_menu
  MenuCategory.where(menu: self.menu).each {|_menu_category|
    _menu_category_order = _menu_category.order
    if _menu_category_order <= smallest_order
      smallest_order= _menu_category_order
    end
  }
  smallest_order
end

def is_first_of_menu?
  self.order == get_smallest_order_in_menu
end

def is_last_of_menu?
 self.order == get_highest_order_in_menu
end

def get_previous_menu_category
  MenuCategory.where(menu: self.menu).each {|_menu_category|
    previous_menu_category = self.menu.categories[0]
    if _menu_category.order < self.order && _menu_category.order > previous_menu_category.order
     previous_menu_category = _menu_category
   end
   previous_menu_category[0]
 }
end

#******************* Initializers ************************#

def set_initial_order
  self.order = get_highest_order_in_menu + 1 if self.order.nil? || self.order <= get_highest_order_in_menu
end

#***************** Custom Validators *********************#

def order_uniqueness_in_menu
  menu_categories_orders =[]
  MenuCategory.where(menu: self.menu).each {|_menu_category|
    menu_categories_orders.append(_menu_category.order) if _menu_category != self
  }

  if menu_categories_orders.include?(self.order)
    error_message = "menu_category.order (here #{self.order}) must unique inside a menu"
    errors.add(:order, error_message)
  end
end

end
