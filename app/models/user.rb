class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :item_types, dependent: :destroy
  has_many :category_types, dependent: :destroy
end
