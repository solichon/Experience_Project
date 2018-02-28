class DefaultValuesActivities < ActiveRecord::Migration[5.1]
  def change
    change_column_null :activities, :capacity, false
    change_column_default :activities, :capacity, from: nil, to: 1
    change_column_null :activities, :duration_in_minutes, false
    change_column_default :activities, :duration_in_minutes, from: nil, to: 30
  end
end
