# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "User01")
event = Event.create(name: "Cool Event", hosted_by: user.id, date: "10-01-21", time: "06:00PM")
Ticket.create(user_id: user.id, event_id: event.id)