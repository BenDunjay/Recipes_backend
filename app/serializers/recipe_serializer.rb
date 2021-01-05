class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :instructions, :cooking_time, :user_id
end
