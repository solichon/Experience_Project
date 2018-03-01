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
  validates :channel, presence: true

  def total_pax
    adults + children
  end
end

# class Booking < ApplicationRecord
#   belongs_to :client

#   validate :min_pers
#   validates :adults, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :children, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :total_price, presence: true, numericality: true
#   validates :status, presence: true
#   validates :channel, presence: true

#   def min_pers
#     if adults + children == 0
#       errors.add(:adults, "Votre réservation doit compter au minimum 1 personne")
#     end
#   end
# end
