FactoryBot.define do
  factory :book do
    user_id          { Faker::Number.number(digits: 1) }
    title            { Faker::Book.title }
    publisher        { Faker::Book.publisher }
    author           { Faker::Book.author }
    isbn             { '9784839962227' }
  end
end
