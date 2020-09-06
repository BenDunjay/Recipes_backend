class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :age, :favourite_mums_dish
  # has_many :user_recipes
  # has_many :recipes, through: :user_recipes
end
