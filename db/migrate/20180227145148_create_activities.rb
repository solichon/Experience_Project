class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :capacity
      t.integer :duration_in_minutes
      t.string :meeting_point
      t.integer :active
      t.monetize :adult_price, currency: { present: false }
      t.monetize :child_price, currency: { present: false }
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
