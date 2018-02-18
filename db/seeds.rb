# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TODO: Add seeds
user = User.create!(username: "Zackbert", email: "zberto@gmail.com", password: "password", password_confirmation: "password")
user2 = User.create!(username: "Gregbert", email: "gberto@gmail.com", password: "password", password_confirmation: "password")

campaign = Campaign.create!(user: user, title: "Wheel of Time", description: "A group of fated adventurers must save the world...")

# Loot
Item.create!(name: 'sword', details: 'Long, sharp, shiny', value: 100, campaign: campaign)
Item.create!(name: 'shield', details: 'Round, hard, not shiny', value: 30, campaign: campaign)

chapter_eye = Chapter.create!(campaign: campaign, title: 'The Eye of The World', description: 'The adventure begins')
chapter_hunt = Chapter.create!(campaign: campaign, title: 'The Great Hunt', description: 'The adventure continues!')

SettingDetail.create!(campaign: campaign, title: 'Location', description: 'Two Rivers')
SettingDetail.create!(campaign: campaign, title: 'Experience Track', description: 'Fast')

# GM Character
Character.create!(user: user, campaign: campaign, name: 'Thomdril Merrilin', description: 'A wandering bard', primary_class: 'Bard', location: "Emond's Field", level: 6, gold: 30)

# PC Character
Character.create!(user: user2, campaign: campaign, name: 'Rand', description: 'A regular boy in the village', primary_class: 'Farmer', location: "Emond's Field", level: 1, copper: 6)
Character.create!(user: user2, campaign: campaign, name: 'Mat', description: 'A pain in the butt', primary_class: 'Farmer', location: "Emond's Field", level: 1, copper: 7)
Character.create!(user: user2, campaign: campaign, name: 'Perrin', description: 'Slow to action, but thoughtful', primary_class: 'Farmer', location: "Emond's Field", level: 1, copper: 3)
