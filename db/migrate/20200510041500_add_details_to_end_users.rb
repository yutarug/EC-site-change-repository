class AddDetailsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :postal_code, :string
    add_column :end_users, :street_address, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :is_deleted, :boolean
  end
end
