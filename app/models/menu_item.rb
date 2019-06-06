class MenuItem < ApplicationRecord
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
