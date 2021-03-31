class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :difficulty
  validates_presence_of :cooking_time
  validates_presence_of :instructions
end
