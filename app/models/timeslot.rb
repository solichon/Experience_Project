class Timeslot < ApplicationRecord
  belongs_to :activity

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true

end
