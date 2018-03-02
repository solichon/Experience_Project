class RemoveChannelsEnumFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :channel
  end
end
