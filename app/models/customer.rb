class Customer < ActiveRecord::Base
  has_many :orders

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 7 }
end
