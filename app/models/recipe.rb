class Recipe < ApplicationRecord
    has_many :users
    has_many :users, :through :userrecipes
end
