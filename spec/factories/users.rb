FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    birthday { '1930-01-01' }
    first_name { '亜' }
    second_name { '亜' }
  end
end