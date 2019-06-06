class Contact < ApplicationRecord
  attr_accessor :firstname, :lastname, :email, :message
 
  validates :lastname, :firstname, :email, :message, presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true
 
end
