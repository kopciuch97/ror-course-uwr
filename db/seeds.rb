# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Event.create!([{name: 'Dawid Podsiadlo', city: "Warsaw", date: "2018-10-27 20:00:00", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem."}, {name: 'Pink', city: "London", date: "2018-10-30 20:00:00", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem."}, {name: 'OSTR', city: "London", date: "2018-11-10 19:00:00", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem."}, {name: 'Black Eyed Peas', city: "London", date: "2018-11-10 22:00:00", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem."}]) if Rails.env.development?
Ticket.create!([{place: "Number 10", price: 100.00, event_id: 1}, {place: "Number 13", price: 90.00, event_id: 1}, {place: "Number 14", price: 90.00, event_id: 1}, {place: "Number 15", price: 60.00, event_id: 1}, {place: "Number 43", price: 90.00, event_id: 2}, {place: "Number 76", price: 90.00, event_id: 2}, {place: "Number 71", price: 90.00, event_id: 2}]) if Rails.env.development?