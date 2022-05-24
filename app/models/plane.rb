class Plane < ApplicationRecord
  has_many :reservations
  validates :name, :url, :capacity, :images, :price, :speed, presence: true
end
