# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.destroy_all
Pet.destroy_all

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

rand(1..10).times do
  pwd = Faker::Internet.password

  AdminUser.create!(
      email: Faker::Internet.email,
      password: pwd,
      password_confirmation: pwd
  )
end

rand(50..100).times do
  Pet.create!(
      name: Faker::Name.first_name,
      race: Pet::RACE.sample,
      country: ISO3166::Country.all.map(&:alpha2).sample,
      birth_date: Faker::Date.between(from: Date.parse('1-1-1960'), to:  Date.parse('1-1-' + Date.today.year.to_s) - 1.day),
      death_date: Faker::Date.backward(days: 60),
      is_published: [true, false].sample
  )
end