class ItemTypeSerializer < ActiveModel::Serializer
  attributes :id, :menu_items, :name, :description, :price, :category_types

  has_many :category_types, serializer: CategoryTypeSerializer
  has_many :menu_items, serializer: MenuItemSerializer

  belongs_to :user, serializer: UserSerializer
end
