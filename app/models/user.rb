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


  private

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
 end

end
