# frozen_string_literal: true

user = User.create!(username: 'Zackbert',
                    email: 'zberto@gmail.com',
                    password: 'password',
                    password_confirmation: 'password')
user2 = User.create!(username: 'Gregbert',
                     email: 'gberto@gmail.com',
                     password: 'password',
                     password_confirmation: 'password')

campaign = Campaign.create!(user: user,
                            title: 'Wheel of Time',
                            description: 'It begins.')

# Loot
Item.create!(name: 'sword',
             details: 'Long, sharp, shiny',
             value: 100.00,
             campaign: campaign)
Item.create!(name: 'shield',
             details: 'Round, hard, not shiny',
             value: 30.00,
             campaign: campaign)

Chapter.create!(campaign: campaign,
                title: 'The Eye of The World',
                description: 'The adventure begins')
Chapter.create!(campaign: campaign,
                title: 'The Great Hunt',
                description: 'The adventure continues!')

SettingDetail.create!(campaign: campaign,
                      title: 'Location',
                      description: 'Two Rivers')
SettingDetail.create!(campaign: campaign,
                      title: 'Experience Track',
                      description: 'Fast')

# GM Characters
Character.create!(user: user,
                  campaign: campaign,
                  name: 'Thomdril Merrilin',
                  description: 'A wandering bard',
                  primary_class: 'Bard',
                  location: "Emond's Field",
                  level: 6,
                  gold: 30)

# PC Characters
Character.create!(user: user2,
                  campaign: campaign,
                  name: 'Rand',
                  description: 'A regular boy in the village',
                  primary_class: 'Farmer',
                  location: "Emond's Field",
                  level: 1,
                  copper: 6)
Character.create!(user: user2,
                  campaign: campaign,
                  name: 'Mat',
                  description: 'A pain in the butt',
                  primary_class: 'Farmer',
                  location: "Emond's Field",
                  level: 1,
                  copper: 7)
Character.create!(user: user2,
                  campaign: campaign,
                  name: 'Perrin',
                  description: 'Slow to action, but thoughtful',
                  primary_class: 'Farmer',
                  location: "Emond's Field",
                  level: 1,
                  copper: 3)
