FactoryBot.define do
  factory :user do
    name { "John Doe" }
    age { 20 }
    favourite_mums_dish { "Spag bol" }
    username { "test" }
    password { "123" }
  end
end
