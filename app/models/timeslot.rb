class Timeslot < ApplicationRecord
  belongs_to :activity
  has_many :bookings, dependent: :nullify # custom TBD for archive
  has_many :clients, through: :bookings

  enum status: [:empty, :partial, :complete, :cancelled]

  validates :start_datetime, presence: true # future custom
  validates :end_datetime, presence: true
  validates :status, presence: true

  def total_participants
    counter = 0
    self.bookings.each do |i|
      counter += i.total_pax
    end
    return counter
  end

  def name
    start_datetime.strftime("%d %b %Hh%M")
  end


  def title_for_calendar
    "#{activity.title}\n👤#{total_participants}/#{activity.capacity}"
  end

end
