class User < ApplicationRecord
  has_secure_password
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :favourite_mums_dish
  validates :username, uniqueness: { case_sensitive: true }
end
