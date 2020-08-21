class User < ApplicationRecord
  has_many :recipes
  has_many :recipes, through: :userrecipes

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :favourite_mums_dish
end
