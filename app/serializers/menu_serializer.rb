class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :subtitle, :menu_categories, :user

  belongs_to :user, serializer: UserSerializer
  has_many :menu_categories, serializer: MenuCategorySerializer

end