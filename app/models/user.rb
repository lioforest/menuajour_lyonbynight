class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :item_types, dependent: :destroy
  has_many :category_types, dependent: :destroy
  has_many :subscriptions, dependent: :destroy



################################################
################## Methods #####################
################################################

#***************** Public *********************#

def create_new_category_type(_name)
  CategoryType.create(name: _name, user: self)
end

def create_new_menu(_name, _title, _subtitle)
  Menu.create(name: _name, title: _title, subtitle: _subtitle, user: self)
end

def category_type_by_id(_category_type_id)
  self.category_types.find(_category_type_id)
end

def category_type_by_menu_category(_menu_category)
  _menu_category.category_type
end

#***************** Private ********************#

private

#after_create
def welcome_send
  UserMailer.welcome_email(self).deliver_now
end

end
