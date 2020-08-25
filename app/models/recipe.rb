class Recipe < ApplicationRecord
  has_many :users
  has_many :users, through: :userrecipes

  validates_presence_of :name
  validates_presence_of :difficulty
  validates_presence_of :cooking_time
  validates_presence_of :instructions
end
