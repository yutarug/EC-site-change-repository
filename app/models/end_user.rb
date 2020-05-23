class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :first_name, :second_name, :first_name_kana, :second_name_kana,
         		   :postal_code, :street_address, :phone_number,  presence: true

         has_many :cart_items
end
