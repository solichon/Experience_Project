class RemoveTotalPriceBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :total_price, :integer
  end
end
