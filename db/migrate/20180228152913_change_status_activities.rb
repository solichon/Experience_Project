class ChangeStatusActivities < ActiveRecord::Migration[5.1]
  def change
    change_column_null :activities, :status, false
    change_column_default :activities, :status, from: nil, to: 0
  end
end
