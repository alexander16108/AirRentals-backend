class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :plane

  validates :date_of_reservation, presence: true
  validates :end_of_reservation, presence: true
  validates :user_id, presence: true
  validates :plane_id, presence: true
  validates_inclusion_of :cancelled, in: [true, false]
end
