class RenameColumnActivtiesinTableImageUrltoImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :activities, :image_url, :image
  end
end
