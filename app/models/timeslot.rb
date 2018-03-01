class Timeslot < ApplicationRecord
  belongs_to :activity
  has_many :bookings, dependent: :nullify # custom TBD for archive
  has_many :clients, through: :bookings

  enum status: [:empty, :partial, :complete, :cancelled]

  validates :start_datetime, presence: true # future custom
  validates :end_datetime, presence: true
  validates :status, presence: true

end
