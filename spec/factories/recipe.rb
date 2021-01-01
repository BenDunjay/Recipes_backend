FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    difficulty { "easy" }
    cooking_time { Faker::Number.within(range: 1..1000) }
    instructions { Faker::String.random(length: 3..12) }
    association :user
  end
end
