require 'faker'

FactoryGirl.define do
  factory :contact do 
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.cell_phone }
  end

end
