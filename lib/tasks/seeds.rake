desc "Create new seed data"

task :seeding, [:number] => [:environment] do |t, args|
  data_amount = (args[:number])
  data_amount.to_i.each do |i|
    user = User.new(name: "name #{i}", age: "#{i}", favourite_mums_dish: "dish #{i}", username: "person #{i}", password: "123")
    user.recipes.build(name: "recipe #{i}", difficulty: "easy #{i}", cooking_time: "#{i}", instructions: "instructions #{i}")
  end
  puts "Seeding created."
end
