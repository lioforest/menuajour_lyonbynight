class ItemTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category_types, :menu_items, :user

  belongs_to :user, serializer: UserSerializer

  has_many :menu_items, serializer: MenuItemSerializer
  has_many :category_types, serializer: CategoryTypeSerializer

end
