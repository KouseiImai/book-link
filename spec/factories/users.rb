FactoryBot.define do
  factory :user do
    id          { Faker::Number.number(digits: 1) }
    nickname                  { Faker::Name.initials }
    email                     { Faker::Internet.free_email }
    gender_id                 { Faker::Number.within(range: 0..2) }
    age_id                    { Faker::Number.within(range: 1..6) }
    password                  { Faker::Internet.password(min_length: 6) }
    password_confirmation     { password }
  end
end
