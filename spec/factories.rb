require 'faker'

FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :contact do
    name { Faker::Name.name }
    phone_number { "17039" + (0..9).to_a.sample(6).join }
  end

  factory :group do
    name { Faker::Company.name }
  end

end
