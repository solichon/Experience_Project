class Timeslot < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :clients, through: :bookings

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true

end
