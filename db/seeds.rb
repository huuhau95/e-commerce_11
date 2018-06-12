# User.create!(name:  "Example User", email: "hungnx96@gmail.com",
#   password: "123123", password_confirmation: "123123", role: 1)
4.times do |n|
  name  = Faker::Book.author
  Category.create!(name:  name,status: 1)
end
