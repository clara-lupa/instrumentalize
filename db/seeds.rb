# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

PASSWORD = "123456"
INSTRUMENTS = %w[guitar double-base e-base trumpet violin viola clarinet]
STREETS =["Hermannstrasse", "Kienitzer Strasse", "Karl-Marx-Strasse", "Sonnenallee", "Nogatstrasse"]

Rental.destroy_all
Instrument.destroy_all
User.destroy_all

puts "creating a test user to log in"
User.create(email: "test@test.com", password: PASSWORD)

puts "creating 10 users with one instrument each"
10.times do
  email = Faker::Internet.email
  user = User.create(email: email, password: PASSWORD)
  Instrument.create(
    name: INSTRUMENTS.sample.capitalize,
    description: Faker::Lorem.sentence,
    price_per_day: rand(100),
    # address: Faker::Address.full_address,
    address: "#{STREETS.sample} #{rand(60)}, Berlin, Germany",
    user: user
    )
end
puts "created 10 users with instruments"

