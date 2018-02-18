# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TODO: Add seeds
user = User.create!(username: "Zackbert", email: "zberto@gmail.com", password: "password", password_confirmation: "password")

Campaign.create!(user: user, title: "Wheel of Time", descriptiin: "A group of fated adventurers must save the world...")
