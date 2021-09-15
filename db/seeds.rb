# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Ticket.destroy_all


user1 = User.create(username: "User01")
user2 = User.create(username: "Bill1984")
user3 = User.create(username: "AwesomeUser33")
user4 = User.create(username: "BestUsernameEver")


event1 = Event.create(name: "Cool Event", hosted_by: user1.id, date: "10-01-21", time: "06:00PM")
event2 = Event.create(name: "Bake Sale", hosted_by: user2.id, date: "09-20-21", time: "04:00PM")
event3 = Event.create(name: "House Party", hosted_by: user3.id, date: "10-05-21", time: "07:00PM")



Ticket.create(user_id: user2.id, event_id: event1.id)
Ticket.create(user_id: user1.id, event_id: event2.id)
Ticket.create(user_id: user3.id, event_id: event1.id)
Ticket.create(user_id: user4.id, event_id: event2.id)