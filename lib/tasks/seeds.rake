desc "Create new seed data"
task :seeding do
  data_amount = ENV["N"].to_i
  Rake::Task["db:drop"].execute
  Rake::Task["db:create"].execute
  Rake::Task["db:migrate"].execute
  data_amount.times do |i|
    user = User.new(name: "name #{i}", age: "#{i}", favourite_mums_dish: "dish #{i}", username: "person #{i}", password: "123")
    user.recipes.build(name: "recipe #{i}", difficulty: "easy #{i}", cooking_time: "#{i}", instructions: "instructions #{i}")
    user.save
  end
  puts "Seeding created."
end
