class RenameActiveActivities < ActiveRecord::Migration[5.1]
  def change
    rename_column :activities, :active, :status
  end
end
