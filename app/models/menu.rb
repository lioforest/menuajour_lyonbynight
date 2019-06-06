class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :categories, source: :menu_categories, class_name: "MenuCategory", dependent: :destroy




  def add_category(_category_type, _order = 0)
    MenuCategory.create(menu: self, category_type: _category_type, order: _order)
  end

end
