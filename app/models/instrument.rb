class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :name, presence: true
  validates :user, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
