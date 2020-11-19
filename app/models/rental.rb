class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :start_date, :end_date, :user, :instrument, presence: true
  validate  :end_date_must_be_after_start_date, if: (:end_date && :start_date)

  def end_date_must_be_after_start_date
    errors.add(:end_date, "must be after the start.") if end_date <= start_date
  end
end
