# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.destroy_all
User.destroy_all

user = User.create!(email: "user@example.com", password: "password")

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
    user: User.first #to be merged with users seeds
    )
  puts "done activity seed #{i}"
end
