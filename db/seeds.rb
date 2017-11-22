# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
#CSV.foreach(Rails.root.join('movie_list.csv'))


User.create(
	email: "admin@asdf.com",
	password: "asdfasdf",
	password_confirmation: "asdfasdf",
	role: "admin"
)

User.create(
	email: "regular@asdf.com",
	password: "asdfasdf",
	password_confirmation: "asdfasdf",
	role: "regular"
)

CSV.open(Rails.root.join('movie_list.csv'),'r').each do |csv|
	Movie.create(
		title: csv[0],
		desc: csv[2],
		remote_photo_url_url: csv[1], #Imageuploader detour
		user_id: 1
	)
end
