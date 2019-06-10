class MenuItem < ApplicationRecord
  validates :order, presence: true
  validate :order_uniqueness_in_menu_category

  before_validation :set_initial_order, on: :create

  belongs_to :menu_category
  belongs_to :item_type


################################################
################## Methods #####################
################################################

#***************** Public *********************#
#Getters
def name
  self.item_type.name
end

def description
  self.item_type.name
end

def price
  self.item_type.name
end

#movers
def move_up
  if !is_first_of_menu_category?
    previous_menu_item = get_previous_menu_item
    previous_order = previous_menu_item.order
    self_order = self.order
    previous_menu_item.order = get_highest_order_in_menu_category + 1
    previous_menu_item.save
    self.order = previous_order
    self.save
    previous_menu_item.order = self_order
    previous_menu_item.save
  end
end

def move_down
  if !is_last_of_menu_category?
    next_menu_item = get_next_menu_item
    next_order = next_menu_item.order
    self_order = self.order
    next_menu_item.order = get_highest_order_in_menu_category + 1
    next_menu_item.save
    self.order = next_order
    self.save
    next_menu_item.order = self_order
    next_menu_item.save
  end
end

#***************** Private *********************#

private

def get_highest_order_in_menu_category
  highest_order = -1
  MenuItem.where(menu_category: self.menu_category).each {|_menu_item|
    menu_item_order = _menu_item.order
    if menu_item_order >= highest_order
      highest_order = menu_item_order
    end
  }
  highest_order
end

def get_smallest_order_in_menu_category
  smallest_order = get_highest_order_in_menu_category
  MenuItem.where(menu_category: self.menu_category).each {|_menu_item|
    menu_item_order = _menu_item.order
    if menu_item_order <= smallest_order
      smallest_order= menu_item_order
    end
  }
  smallest_order
end

def is_first_of_menu_category?
  self.order == get_smallest_order_in_menu_category
end

def is_last_of_menu_category?
 self.order == get_highest_order_in_menu_category
end

def get_previous_menu_item
  previous_menu_item = self.menu_category.items.first
  MenuItem.where(menu_category: self.menu_category).each {|_menu_item|
    if _menu_item.order < self.order && _menu_item.order > previous_menu_item.order
     previous_menu_item = _menu_item
   end
 }
 previous_menu_item
end

def get_next_menu_item
  next_menu_item = self.menu_category.items.last
  MenuItem.where(menu_category: self.menu_category).each {|_menu_item|
    if _menu_item.order > self.order && _menu_item.order < next_menu_item.order
     next_menu_item = _menu_item
   end
 }
 next_menu_item
end
  #******************* Initializers ************************#

  def set_initial_order
    self.order = get_highest_order_in_menu_category + 1 if self.order.nil? || self.order <= get_highest_order_in_menu_category
  end

#***************** Custom Validators *********************#

def order_uniqueness_in_menu_category
  menu_items_orders =[]
  MenuItem.where(menu_category: self.menu_category).each {|_menu_item|
    menu_items_orders.append(_menu_item.order) if _menu_item != self
  }
  if menu_items_orders.include?(self.order)
    error_message = "menu_item.order (here #{self.order}) must unique inside a _category"
    errors.add(:order, error_message)
  end
end

end
