class AddStatusToTimeslots < ActiveRecord::Migration[5.1]
  def change
    add_column :timeslots, :status, :integer, default: 0, null: false
  end
end
