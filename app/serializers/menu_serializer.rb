class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :subtitle

  belongs_to :user, serializer: UserSerializer
end