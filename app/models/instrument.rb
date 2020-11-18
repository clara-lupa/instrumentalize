class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :name, presence: true
  validates :user, presence: true
  validates :price_per_day, presence: true, numericality: true

end
