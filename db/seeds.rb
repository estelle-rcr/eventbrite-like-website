# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::UniqueGenerator.clear

User.destroy_all
Event.destroy_all
Attendance.destroy_all
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

5.times do |index|
  User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    description: Faker::Lorem.paragraph_by_chars(number: 156, supplemental: true),
    email: "estelle-r-#{index}@yopmail.com", 
    password: Faker::Code.asin,
    )
end

15.times do |index|
  Event.create!(
    start_date: Date.today+rand(10000),
    duration: rand(5..1440).round(-1),
    title: Faker::Book.title,
    description: Faker::Hipster.sentence(word_count: 20, supplemental: true), 
    price: rand(1..1000),
    location: Faker::Address.city,
    admin: User.all.sample
  )
end

60.times do |index|
  Attendance.create!(
    stripe_customer_id: Faker::Internet.uuid,
    attendee: User.all.sample,
    event: Event.all.sample
  )
end