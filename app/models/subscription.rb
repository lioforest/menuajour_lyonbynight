class Subscription < ApplicationRecord
  after_create :new_subscription_send, :new_subscription_admin_send
  belongs_to :user

  def new_subscription_send
   UserMailer.new_subscription_email(self).deliver_now
  end

  def new_subscription_admin_send
   UserMailer.new_subscription_admin_email(self).deliver_now
  end 

end
