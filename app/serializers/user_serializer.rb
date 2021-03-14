class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :age, :favourite_mums_dish
end
