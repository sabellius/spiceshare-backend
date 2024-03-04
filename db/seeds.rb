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
    first_name: first_name,
    last_name: last_name,
    username: Faker::Internet.unique.username,
    email: Faker::Internet.email(name: "#{first_name} #{last_name}", separators: ['.'], domain: 'example.com'),
    password: Faker::Internet.password(min_length: 8, special_characters: true)
  )
end
