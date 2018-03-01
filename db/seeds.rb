# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# require 'faker'

Booking.destroy_all
Timeslot.destroy_all
Activity.destroy_all
Client.destroy_all
User.destroy_all


# USERS

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

9.times do |i|
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
  puts "done user seed #{i + 1}"
end


# ACTIVITIES

puts "Creating activities seeds on test user"
10.times do |i|
  activity = Activity.create!(
    title: Faker::Dessert.variety,
    description: Faker::Lorem.sentence,
    capacity: (1..20).to_a.sample.to_i,
    duration_in_minutes: [30, 60, 120, 180, 240].sample.to_i,
    meeting_point: Faker::Address.street_address,
    status: (0..1).to_a.sample.to_i,
    adult_price: (10..20).to_a.sample.to_i,
    child_price:(0..10).to_a.sample.to_i,
    image_url: Faker::LoremPixel.image("50x60", false, 'sports'),
    user: test
    )
  puts "done activity seed #{i + 1}"

# TIMESLOTS

 puts "Creating timeslots seeds"
  5.times do |j|
    start_datetime = Faker::Time.forward(15, :day)
    timeslot = Timeslot.create!(
      start_datetime:start_datetime,
      end_datetime: start_datetime + activity.duration_in_minutes * 60,
      activity: activity
      )
    puts "done timeslot seed #{j + 1}"

# CLIENTS

    puts "Creating clients seeds"
    5.times do |k|
      client = Client.create!(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone_number: Faker::PhoneNumber.phone_number,
          email: Faker::Internet.email,
        )
        puts "done clients seeds #{k + 1}"

# BOOKINGS

     puts "Creating booking seeds"
      5.times do |l|
        booking = Booking.create!(
          client: client,
          timeslot: timeslot,
          adults: (1..2).to_a.sample.to_i,
          children: (0..3).to_a.sample.to_i,
          comments: Faker::Lorem.sentence,
          total_price: (20..80).to_a.sample.to_i,
          status: (0..1).to_a.sample.to_i,
          channel: (0..4).to_a.sample.to_i,
          )
      puts "done bookings seeds #{l + 1}"
      end
    end
  end
end

puts "#{User.count} users seeded"
puts "#{Activity.count} activities seeded"
puts "#{Timeslot.count} timeslots seeded"
puts "#{Booking.count} bookings seeded"
puts "#{Client.count} clients seeded"

