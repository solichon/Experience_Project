class AddChannelSourceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :channel_source, :integer
  end
end
