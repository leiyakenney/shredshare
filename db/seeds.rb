# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

driver_1 = User.create!(user_name: "driver_1", first_name: "Jerry", last_name: "Jones", email: "jerry@jerry.com", password: "password", password_confirmation: "password")
vehicle_1 = driver_1.vehicles.create!(make: "Toyota", model: "Tacoma", year: "2014", total_seats: "4")
rtd_location = RtdLocation.create!(area: "Denver", name: "University of Denver", address: "123 Rtd St. Denver CO, 80210")
trip_1 = Trip.create!(user_id: driver_1.id, seats_available: 2, vehicle_id: 1, rtd_location_id: 1, destination_point: "Keystone", date_of_departure: "Nov 30 2019", ride_type: "one-way")

passenger_1 = User.create!(user_name: "passenger_1", first_name: "Jerralina", last_name: "Jeffries", email: "jerralina@jerry.com", password: "password", password_confirmation: "password")
ride_1 = Ride.create!(trip_id: trip_1.id, user_id: passenger_1.id)
