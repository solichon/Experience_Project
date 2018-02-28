# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Booking.destroy_all
Client.destroy_all
User.destroy_all


puts "Creating users seeds"
test = User.create!(
  company_name: "Company",
  SIRET: "12345678901234",
  first_name: "First",
  last_name: "Last",
  phone_number: "+33 6 11 22 33 44",
  email: "test@test.com",
  password: "azerty",
  website: "www.website.com"
  )
puts "done user test"

10.times do |i|
  user = User.create!(
    company_name: Faker::Company.name,
    SIRET: Faker::Company.french_siret_number,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(10),
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    website: "www.#{Faker::Internet.domain_word}.com"
    )
  puts "done user seed #{i}"
end

10.times do
  client = Client.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
    )
end
puts "done clients seeds"


puts "Creating booking seeds"
10.times do |i|
  booking = Booking.create!(
    client_id: Client.first.id,
    adults: (1..2).to_a.sample.to_i,
    children: (0..3).to_a.sample.to_i,
    comments: Faker::Lorem.sentence,
    total_price: (20..80).to_a.sample.to_i,
    status: (0..1).to_a.sample.to_i,
    channel: (0..4).to_a.sample.to_i,
    )
puts "done bookings seeds #{i}"
end



