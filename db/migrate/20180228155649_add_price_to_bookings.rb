class AddPriceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :total_price, currency: { present: false }
  end
end
