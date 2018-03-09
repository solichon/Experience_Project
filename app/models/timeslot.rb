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

    def total_adults
    counter = 0
    self.bookings.each do |i|
      counter += i.adults
    end
    return counter
  end

  def total_children
    counter = 0
    self.bookings.each do |i|
      counter += i.children
    end
    return counter
  end

  def name
    start_datetime.strftime("%d %b %Hh%M")
  end

  def title_for_calendar(is_xs)
    if is_xs
      "#{activity.title}"
    else
      "#{activity.title}\n#{capacity_for_title}"
    end
  end

  def capacity_for_title
    if total_participants == activity.capacity
      "Complet" #self.status = "complete"
    elsif total_participants >= 0.7*activity.capacity
      "👤 #{total_participants}/#{activity.capacity}"
    else
      "👤 #{total_participants}/#{activity.capacity}"
    end
  end

  def capacity_for_calendar
    if total_participants == activity.capacity
      "<span style='color:#00DCB1;'>🧔🏻 #{total_adults} - 👶🏻 #{total_children} </span>"
    elsif total_participants >= 0.7*activity.capacity
      "<span style='color:#DDB900;'>🧔🏻 #{total_adults} - 👶🏻 #{total_children}</span>"
    else
      "<span style='color:#FF6F59;'>🧔🏻 #{total_adults} - 👶🏻 #{total_children}</span>"
    end
  end
end
