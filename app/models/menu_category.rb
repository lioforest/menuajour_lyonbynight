class MenuCategory < ApplicationRecord
  validates :order, presence: true

  belongs_to :menu
  belongs_to :category_type

  has_many :items, source: :menu_items, class_name: "MenuItem", dependent: :destroy

  def name
    self.category_type.name
  end

  def add_item(_item_type, _order = 0)
    MenuItem.create(item_type: _item_type, menu_category: self, order: _order)
  end

end
