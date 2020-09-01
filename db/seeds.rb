# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Recipe.delete_all
UserRecipe.delete_all

user_1 = User.create(name: "person_1", age: 20, favourite_mums_dish: "mum_1")
user_2 = User.create(name: "person_2", age: 21, favourite_mums_dish: "mum_2")
user_3 = User.create(name: "person_3", age: 22, favourite_mums_dish: "mum_3")
user_4 = User.create(name: "person_4", age: 23, favourite_mums_dish: "mum_4")
user_5 = User.create(name: "person_5", age: 24, favourite_mums_dish: "mum_5")

recipe_1 = Recipe.create(name: "recipe_1", difficulty: "difficulty_1", cooking_time: 1, instructions: "long string 1")
recipe_2 = Recipe.create(name: "recipe_2", difficulty: "difficulty_2", cooking_time: 2, instructions: "long string 2")
recipe_3 = Recipe.create(name: "recipe_3", difficulty: "difficulty_3", cooking_time: 3, instructions: "long string 3")
recipe_4 = Recipe.create(name: "recipe_4", difficulty: "difficulty_4", cooking_time: 4, instructions: "long string 4")
recipe_5 = Recipe.create(name: "recipe_5", difficulty: "difficulty_5", cooking_time: 5, instructions: "long string 5")

user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id)
user_recipe_2 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_2.id)
user_recipe_3 = UserRecipe.create(user_id: user_3.id, recipe_id: recipe_3.id)
user_recipe_4 = UserRecipe.create(user_id: user_4.id, recipe_id: recipe_4.id)
user_recipe_5 = UserRecipe.create(user_id: user_5.id, recipe_id: recipe_5.id)
