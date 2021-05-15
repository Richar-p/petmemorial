# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { "name" }
    race { Pet::RACE.sample }
    country { ISO3166::Country.all.map(&:alpha2).sample }
    birth_date { Time.now - 10.day }
    death_date { Time.now - 5.day }
  end
end
