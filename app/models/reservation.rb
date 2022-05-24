class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :plane

  validates :date_of_reservation, presence: true
  validates :end_of_reservation, presence: true
  validates :user_id, presence: true
  validates :plane_id, presence: true
  validates :date_of_reservation, comparison: { less_than: :end_of_reservation }
  validates :end_of_reservation, comparison: { greater_than: :date_of_reservation }
  validates_inclusion_of :cancelled, in: [true, false]
end
