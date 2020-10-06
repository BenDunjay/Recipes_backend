class Recipe < ApplicationRecord
  # has_many :ingredients
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :difficulty
  validates_presence_of :cooking_time
  validates_presence_of :instructions
end
