class UserRecipeSerializer < ActiveModel::Serializer
    attributes :user_id, :id, :name, :difficulty, :instructions, :cooking_time, :user_id
  end
  