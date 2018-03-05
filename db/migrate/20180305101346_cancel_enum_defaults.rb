class CancelEnumDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_null :activities, :status, true
    change_column_default :activities, :status, nil
    change_column_null :timeslots, :status, true
    change_column_default :timeslots, :status, nil
    change_column_default :bookings, :status, nil
  end
end
