class MenuSerializer < ActiveModel::Serializer
  attributes :email, :first_name, :last_name
end