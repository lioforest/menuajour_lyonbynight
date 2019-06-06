class MenuItem < ApplicationRecord
  validates :order, presence: true

  belongs_to :menu_category
  belongs_to :item_type



  def name
    self.item_type.name
  end

  def description
    self.item_type.name
  end

  def price
    self.item_type.name
  end
end
