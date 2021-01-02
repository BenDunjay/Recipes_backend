FactoryBot.define do
  factory :user do
    name { "John Doe" }
    age { 20 }
    favourite_mums_dish { "Spag bol" }
    username { "test1" }
    password { "123" }
  end

  factory :random_user, class: User do
    name { Faker::Name.unique.name }
    age { Faker::Number.within(range: 16..90) }
    favourite_mums_dish { Faker::Food.dish }
    username { Faker::Name.unique.name }
    password { "123" }
  end
end

def user_with_recipes(recipes_count: 5)
  FactoryBot.create(:random_user) do |random_user|
    FactoryBot.create_list(:recipe, recipes_count, user: random_user)
  end
end
