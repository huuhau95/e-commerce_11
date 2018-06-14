# User.create!(name:  "Example User", email: "hungnx96@gmail.com",
#   password: "123123", password_confirmation: "123123", role: 1)
4.times do |n|
  name  = Faker::Book.author
  Category.create!(name:  name,status: 1)
end

5.times do |n|
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
