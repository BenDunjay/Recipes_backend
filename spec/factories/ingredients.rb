FactoryBot.define do
  factory :ingredient do
    name { "MyString" }
    type { "" }
    amount { 1 }
    recipe { nil }
  end
end
