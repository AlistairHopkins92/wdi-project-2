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
                  last_name: "Holden",
                  image: "https://scontent-lhr3-1.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/12239642_10207682695402759_8883733882515923248_n.jpg?oh=0508e4ef8506ff03b20d5f613cd711a8&oe=57ACFC10")
            
u2 = User.create!(email: "car@line.com", 
                  password: "password", 
                  username: "thereddevil", 
                  first_name: "Caroline", 
                  last_name: "Benn",
                  image: "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/11986309_10156089835410717_4357400115308770694_n.jpg?oh=3155025415aff767016e26bf38840894&oe=57A27204")

u3 = User.create!(email: "ali@ali.com", 
                  password: "password", 
                  username: "coolgu123", 
                  first_name: "Alistair", 
                  last_name: "Hopkins",
                  image: "https://scontent-lhr3-1.xx.fbcdn.net/hphotos-frc3/v/t1.0-9/945089_10151735137480874_283854846_n.jpg?oh=031b2d990eda499b4dedc556a131a78c&oe=57AC7733")

u4 = User.create!(email: "chanse@chanse.com", 
                  password: "password", 
                  username: "norfolkandchanse", 
                  first_name: "Chanse", 
                  last_name: "Campbell",
                  image: "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/10487341_10152623610161057_701642286112268607_n.jpg?oh=119efb67d959ec6c823b5f44011e63ca&oe=57B0B25A")

u5 = User.create!(email: "paddy@paddy.com", 
                  password: "password", 
                  username: "notirish", 
                  first_name: "Paddy", 
                  last_name: "de Klee",
                  image: "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/11391247_10152763205312493_2292968833916584004_n.jpg?oh=5e35d99a5df853966f054882ddcdfeb5&oe=579E9CD8")




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

