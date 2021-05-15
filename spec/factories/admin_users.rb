# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { "User@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
