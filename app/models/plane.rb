class Plane < ApplicationRecord
  has_many :reservations
  validates :name, :url, :capacity, :images, :price, :speed, :reservation_expiration_date, presence: true
end
