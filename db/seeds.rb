<<<<<<< d960cc5b187dadb3c2689fdfb1a758f2c45b23e6
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
=======
10.times do |n|
  name  = Faker::Name.name
  Category.create!(name:  name)
end
User.create!(name:  "Example User", email: "hungnx96@gmail.com",
  password: "123123", password_confirmation: "123123", role: 1)
User.create!(name:  "Example User", email: "hungnx06@gmail.com",
  password: "123123", password_confirmation: "123123", role: 2)
users = User.order(:created_at).take(3)
10.times do |n|
  name  = Faker::Lorem.sentence(2)
  phone = "093457876#{n+1}"
  users.each {|user| user.orders.create!(address:  name, phone: phone,
    created_at: Time.zone.now)}
end
>>>>>>> manage_orders
