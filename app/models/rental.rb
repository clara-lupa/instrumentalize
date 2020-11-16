class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :start, :end, :user, :instrument, presence: true
  # the following validation is not working !! fix it !
  # validate  :startdate_enddate?

  # def startdate_enddate?
  #   :start < :end
  # end
end
