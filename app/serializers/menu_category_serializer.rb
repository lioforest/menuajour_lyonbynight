class MenuCategorySerializer < ActiveModel::Serializer
  attributes :id, :order, :category_type, :menu, :menu_items


  belongs_to :menu, serializer: MenuSerializer
  belongs_to :category_type, serializer: CategoryTypeSerializer

  has_many :menu_items, serializer: MenuItemSerializer

end
