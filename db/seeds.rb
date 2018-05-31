# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do |n|
#   name  = Faker::Name.name
#   Category.create!(name:  name)
# end

# 10.times do |n|
#   name  = Faker::Name.name
#   Product.create!(name:  name,
#   status: 1,
#   price: 30000,
#   category_id: 5
#   )
# end
4.times do |n|
  name  = Faker::Book.author
  Category.create!(name:  name,status: 1)
end

10.times do |n|
  name  = Faker::Book.title
  Product.create!(name:  name,
  status: 1,
  quantity: rand(5..10),
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  price: rand(3500..7000),
  new_price: rand(3500..6000),
  category_id: rand(1..4),
  )
end
# 40.times do |n|
#   Image.create!(image_url:  "https://qph.fs.quoracdn.net/main-qimg-680c8f445130201b7b1850e7d02d76dd-c",
#     product_id: rand(1..10))
# end
