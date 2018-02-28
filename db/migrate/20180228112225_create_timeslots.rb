class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
