class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :menu_categories, dependent: :destroy




################################################
################## Methods #####################
################################################

#***************** Public *********************#

def categories
  self.menu_categories.order(:order)
end

def add_category(_category_type)
  MenuCategory.create(menu: self, category_type: _category_type, order: 0)
end

def add_category_by_name(_category_type_name)
  category_type = CategoryType.where(name: _category_type_name)[0]
  MenuCategory.create(menu: self, category_type: category_type, order: 0)
end

end
