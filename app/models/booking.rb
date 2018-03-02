class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :timeslot

  monetize :total_price_cents

  enum status: [:booked, :confirmed, :paid, :cancelled]

  validates :total_pax, numericality: { greater_than_or_equal_to: 1 }
  validates :adults, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :children, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_price, presence: true, numericality: true
  validates :status, presence: true
  validate :timeslot_not_overbooked

  def total_pax
    adults + children
  end

  def timeslot_not_overbooked
    capacity = timeslot.activity.capacity
    participants = timeslot.total_participants
    unless participants < capacity
      remaining = capacity - participants
      errors.add(:adults, "Il ne reste plus que #{remaining} place(s) au total")
      errors.add(:children, "Il ne reste plus que #{remaining} place(s) au total")
    end
  end
end

# class Booking < ApplicationRecord
#   belongs_to :client

#   validate :min_pers
#   validates :adults, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :children, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :total_price, presence: true, numericality: true
#   validates :status, presence: true

#   def min_pers
#     if adults + children == 0
#       errors.add(:adults, "Votre réservation doit compter au minimum 1 personne")
#     end
#   end
# end
