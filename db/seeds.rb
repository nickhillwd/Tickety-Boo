# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Act.delete_all
Act.create(act_name:'Oasis', act_details:'90s rock and roll band')

Booking.delete_all
Booking.create(user_id:3, event_id:3)

Event.delete_all
Event.create(act_id:3, venue_id:3, event_start_time:'2016-01-20 12:00:00', event_end_time:'2016-01-20 14:00:00', event_details:'Concert', event_price:50.50)

Genre.delete_all
Genre.create(act_id:3, event_id:3, category:'rock and roll')

User.delete_all
User.create(email:'user1@example.com', password:'Password1')

Venue.delete_all
Venue.create(venue_name:'MEN arena', venue_location:'Manchester', venue_capacity:1000)