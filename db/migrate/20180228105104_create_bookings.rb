class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :client, foreign_key: true
      t.integer :adults, default: 0
      t.integer :children, default: 0
      t.text :comments
      t.integer :total_price, default: 0
      t.integer :status, default: 0
      t.integer :channel, default: 0

      t.timestamps
    end
  end
end
