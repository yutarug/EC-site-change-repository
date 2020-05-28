# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Item.create!(
	name:"ザッハトルテ",
	genre_id: 1,
	price:50,
	status:true)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)
Genre.create!(
	name: "ケーキ",
	effectice_status: false)
Address.create!(
	end_user_id:1,
	address: "アアア",
	postal_code: "イイ",
	street_address: "神戸")