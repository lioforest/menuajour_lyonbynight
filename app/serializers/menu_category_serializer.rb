class MenuCategorySerializer < ActiveModel::Serializer
  attributes :id, :category_type, :order, :menu_items, :menu

  belongs_to :menu, serializer: MenuSerializer
  belongs_to :category_type, serializer: CategoryTypeSerializer

  has_many :menu_items, serializer: MenuItemSerializer
end
