class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :order, :menu_category, :item_type

  belongs_to :menu_category, serializer: MenuCategorySerializer
  belongs_to :item_type, serializer: ItemTypeSerializer
end
