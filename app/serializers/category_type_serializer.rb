class CategoryTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_types, :menu_categories

  belongs_to :user, serializer: UserSerializer
  
  has_many :menu_categories, serializer: MenuCategorySerializer
  has_many :item_types, serializer: ItemTypeSerializer
end
