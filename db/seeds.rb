# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'paperclip'

user = User.create!({name: "Example Morales", email: "example_user@itineraryapp.com", password: "foobar",
  password_confirmation: "foobar"})

  user.itineraries.create!({country: "Italy", locations: "Rome, Venice, Florence",
    trip_duration: "2 weeks", budget: 2500,
    document: File.new("public/itinerary_example.pdf")})

#Itinerary.create({country: "Italy", locations: "Rome, Venice, Florence",
#  trip_duration: "2 weeks", budget: 2500,
#  document: File.new("app/assets/itinerary_example.pdf")})

#  Itinerary.create({country: "Italy", locations: "Sorrento, Bologna, Capri",
#    trip_duration: "2 weeks", budget: 2500,
#    document: File.new("app/assets/itinerary_2.pdf"), user_id: 2})
