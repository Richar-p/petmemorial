FactoryBot.define do
  factory :admin_user do
    email { 'User@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
