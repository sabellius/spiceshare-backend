# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name:,
    last_name:,
    username: Faker::Internet.unique.username,
    email: Faker::Internet.email(name: "#{first_name} #{last_name}", separators: ['.'], domain: 'example.com'),
    password: Faker::Internet.password(min_length: 8, special_characters: true),
    jti: Faker::Internet.uuid
  )
end

recipes = File.read(Rails.root.join('db/seeds/recipes.json'))
parsed_recipes = JSON.parse(recipes, object_class: OpenStruct)
parsed_recipes.each do |recipe|
  recipe_object = Recipe.create!(
    title: recipe.title,
    description: recipe.description,
    prep_time: recipe.prep_time,
    cook_time: recipe.cook_time,
    servings: recipe.servings,
    user: User.all.sample
  )
  recipe.ingredients.each do |i|
    recipe_object.ingredients << Ingredient.create!(
      name: i.name,
      amount: i.amount,
      unit: i.unit,
      optional: false,
      recipe: recipe_object
    )
  end
  recipe.instructions.each_with_index do |i, index|
    recipe_object.instructions << Instruction.create!(step_number: index + 1, description: i, recipe: recipe_object)
  end
end
