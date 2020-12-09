FactoryBot.define do
  factory :user do
    nickname                  {"yamada"}
    email                     {"yamada@gmail.com"}
    gender_id                 {1}
    age_id                    {2}
    password                  {"abc1234"}
    password_confirmation     {password}
  end
end