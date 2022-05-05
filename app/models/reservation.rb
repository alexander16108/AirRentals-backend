class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :plane

  validates : date_of_reservation, presence: true
  validates : end_of_reservation, presence: true

end
