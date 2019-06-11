class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :menus, :item_types, :category_types

  has_many :menus, serializer: MenuSerializer
  has_many :item_types, serializer: ItemTypeSerializer
  has_many :category_types, serializer: CategoryTypeSerializer
end