# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Journey.destroy_all

u1 = User.create!(email: "oholdme@night.com", 
                  password: "password", 
                  username: "oholdme", 
                  first_name: "Ollie", 
                  last_name: "Holden")
            
u2 = User.create!(email: "car@line.com", 
                  password: "password", 
                  username: "thereddevil", 
                  first_name: "Caroline", 
                  last_name: "Benn")

j1 = u1.journeys.create!( start_destination: "Manchester",
                          end_destination: "Leeds",
                          departure_date: "27/04/16",
                          price: "£10")
