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

u3 = User.create!(email: "ali@ali.com", 
                  password: "password", 
                  username: "coolgu123", 
                  first_name: "Alistair", 
                  last_name: "Hopkins")

u4 = User.create!(email: "chanse@chanse.com", 
                  password: "password", 
                  username: "norfolkandchanse", 
                  first_name: "Chanse", 
                  last_name: "Campbell")

u5 = User.create!(email: "paddy@paddy.com", 
                  password: "password", 
                  username: "notirish", 
                  first_name: "Paddy", 
                  last_name: "de Klee")




j1 = u1.journeys.create!( start_destination: "Manchester",
                          end_destination: "Leeds",
                          departure_date: "29/04/16",
                          price: 10.00,
                          free_seats: 4)
j2 = u1.journeys.create!( start_destination: "Manchester",
                          end_destination: "York",
                          departure_date: "27/04/16",
                          price: 31.00,
                          free_seats: 4)
j3 = u1.journeys.create!( start_destination: "Manchester",
                          end_destination: "London",
                          departure_date: "28/04/16",
                          price: 3.00,
                          free_seats: 4)
j4 = u2.journeys.create!( start_destination: "London",
                          end_destination: "Leeds",
                          departure_date: "27/04/16",
                          price: 17.00,
                          free_seats: 4)
j5 = u2.journeys.create!( start_destination: "Liverpool",
                          end_destination: "Leeds",
                          departure_date: "30/04/16",
                          price: 21.00,
                          free_seats: 4)
j6 = u2.journeys.create!( start_destination: "Manchester",
                          end_destination: "London",
                          departure_date: "28/04/16",
                          price: 12.00,
                          free_seats: 4)
j7 = u3.journeys.create!( start_destination: "London",
                          end_destination: "Leeds",
                          departure_date: "28/04/16",
                          price: 5.00,
                          free_seats: 4)
j8 = u3.journeys.create!( start_destination: "Manchester",
                          end_destination: "Glasgow",
                          departure_date: "02/05/16",
                          price: 12.00,
                          free_seats: 4)
j9 = u4.journeys.create!( start_destination: "Cardiff",
                          end_destination: "Leeds",
                          departure_date: "01/06/16",
                          price: 11.00,
                          free_seats: 5)
j10 = u5.journeys.create!( start_destination: "Bristol",
                          end_destination: "Cardiff",
                          departure_date: "06/05/16",
                          price: 8.00,
                          free_seats: 1)

c1 = Comment.create!( journey_id: j1.id,
                         agreed_setoff_time: "between 6am and 7am",
                         notes: "No dogs allowed",
                         sender_id: u1.id,
                         receiver_id: u2.id)

