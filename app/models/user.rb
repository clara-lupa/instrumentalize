class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :instruments
  # the rentals below refer to rentals where the user is the renter
  has_many :rentals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
