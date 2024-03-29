class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  validates_presence_of :difficulty
  validates_presence_of :cooking_time
  validates_presence_of :instructions
end
