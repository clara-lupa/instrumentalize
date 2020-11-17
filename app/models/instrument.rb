class Instrument < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :price_per_day, presence: true, numericality: true

end
