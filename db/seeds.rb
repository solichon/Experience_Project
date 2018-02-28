# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# require 'faker'

Activity.destroy_all
Client.destroy_all
User.destroy_all


puts "Creating users seeds"
test = User.create!(
  company_name: "Company",
  SIRET: "12345678901234",
  first_name: "First",
  last_name: "Last",
  phone_number: "+33 6 11 22 33 44",
  email: "user@example.com",
  password: "password",
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

puts "Creating activities seeds on test user"
10.times do |i|
  activity = Activity.create!(
    title: Faker::Dessert.variety,
    description: Faker::Lorem.sentence,
    capacity: (1..20).to_a.sample.to_i,
    duration_in_minutes: [30, 60, 120, 180, 240].sample.to_i,
    meeting_point: Faker::Address.street_address,
    active: (0..1).to_a.sample.to_i,
    adult_price: (10..20).to_a.sample.to_i,
    child_price:(0..10).to_a.sample.to_i,
    image_url: Faker::LoremPixel.image("50x60", false, 'sports'),
    user: test
    )
  puts "done activity seed #{i}"
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

