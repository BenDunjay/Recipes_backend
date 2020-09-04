class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :age, :mums_favourite_dish
  has_many :recipes
end
