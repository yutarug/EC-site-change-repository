class AddNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string
    add_column :end_users, :second_name, :string
    add_column :end_users, :first_name_kana, :string
    add_column :end_users, :second_name_kana, :string
  end
end
