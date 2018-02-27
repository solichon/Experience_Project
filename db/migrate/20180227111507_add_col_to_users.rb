class AddColToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_name, :string
    add_column :users, :SIRET, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :website, :string
  end
end
