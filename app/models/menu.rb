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

def category_by_id(_category_id)
  self.menu_categories.find(_category_id)
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

end
