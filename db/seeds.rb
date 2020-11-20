# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'


STREETS =["Hermannstrasse", "Kienitzer Strasse", "Karl-Marx-Strasse", "Sonnenallee", "Nogatstrasse"]


Rental.destroy_all
Instrument.destroy_all
User.destroy_all

users = [] #are you using this array anywhere in your code?
clara = User.new(email: 'clara@music.com', password: '123456')
clara.photo.attach(io:URI.open("https://avatars3.githubusercontent.com/u/71439281?v=4"), filename:"clara.jpg")
clara.save
magda = User.new(email: 'magda@music.com', password: '123456')
magda.photo.attach(io:URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601888580/sna5wlbfxgfmevyvsw2a.jpg"), filename:"magda.jpg")
magda.save
igor = User.new(email: 'igor@music.com', password: '123456')
igor.photo.attach(io:URI.open("https://avatars2.githubusercontent.com/u/69688651?v=4"), filename:"igor.jpg")
igor.save
dan = User.new(email: 'dan@music.com', password: '123456')
dan.photo.attach(io:URI.open("https://avatars1.githubusercontent.com/u/71282045?v=4"), filename:"dan.jpg")
dan.save
[clara, magda, igor, dan].each { |member| users << member }



instruments = [
  {
    name: "guitar", description: "Whammy!", price_per_day: "25", photo: "https://images.unsplash.com/photo-1564186763535-ebb21ef5277f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "synth", description: "beep bop boop", price_per_day: "15", photo: "https://images.unsplash.com/photo-1560849807-bae5314c9e98?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80"
  },
  {
    name: "clarinet", description: "A real whistler.", price_per_day: "12", photo:"https://images.unsplash.com/photo-1569791832138-fbdd9a500384?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "viola", description: "Underappreciated.", price_per_day: "15", photo:"https://s2.qwant.com/thumbr/0x0/e/9/afdf1cb4656dc5f127c199a34d6485a9fac4014c639d280a4801fc87ef33ce/viola-iS-2.jpg?u=https%3A%2F%2Fwww.musicwithease.com%2Fviola-iS-2.jpg&q=0&b=1&p=0&a=1"
  },
  {
    name: "double bass", description: "boom boom", price_per_day: "30", photo:"https://images.unsplash.com/photo-1576477210278-8f46836b1b5f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "trumpet", description: "Brassy, not honky!", price_per_day: "11", photo:"https://images.unsplash.com/photo-1573871666457-7c7329118cf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "violin", description: "A bit high strung, but plucky.", price_per_day: "17", photo:"https://images.unsplash.com/photo-1528032947483-4e1df543253a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "amp", description: "Totally amped for your gig!", price_per_day: "20", photo:"https://images.unsplash.com/photo-1546518449-3826f84350e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
  },
  {
    name: "keyboard", description: "The keys for your next show.", price_per_day: "22", photo:"https://images.unsplash.com/photo-1598653222000-6b7b7a552625?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    name: "ukelele", description: "Aloha, hipster!", price_per_day: "8", photo:"https://images.unsplash.com/photo-1541447554742-4b7eff548fe1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  }

]


instruments.each do |instrument|
  i = Instrument.new(
    name: instrument[:name],
    description: instrument[:description],
    price_per_day: instrument[:price_per_day],
    address: "#{STREETS.sample} #{rand(60)}, Berlin, Germany"
    user: users.sample)
  i.photo.attach(io:URI.open(instrument[:photo]), filename:"file.jpg")
  i.save
end
puts 'Seeds finished!'






