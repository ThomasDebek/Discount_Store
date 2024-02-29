# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Delete all Data Base and create new...."

Product.destroy_all
User.destroy_all
Brand.destroy_all
Category.destroy_all
Admin.destroy_all
Order.destroy_all
Payment.destroy_all
CartItem.destroy_all
Comment.destroy_all
Payment.destroy_all
OrderItem.destroy_all
Shipment.destroy_all

# db/seeds.rb
require 'faker'
require 'open-uri'


Admin.create(
  email: "admin@gmail.com",
  password: "secret"
)


10.times do
  email_prefix = Faker::Name.first_name.downcase
  User.create(email: "#{email_prefix}@gmail.com", password: 'secret')
end

# Get two random users
user1 = User.all.sample
user2 = (User.all - [user1]).sample

# Create a fixed user "Dave"
dave_user = User.create(email: 'dave@gmail.com', password: 'secret')

users = User.all

Category.destroy_all
4.times do
  Category.create(
    name: Faker::Commerce.department(max: 1)
  )
  print '✔'
end
puts '✅'

Brand.destroy_all
4.times do
  Brand.create(
    name: Faker::Device.manufacturer
  )
end

categories = Category.all
brands = Brand.all

9.times do
  user = users.sample
  category = categories.sample
  brand = brands.sample
  product = user.products.create(name: Faker::Food.ingredient,
                                 price: Faker::Commerce.price(range: 5..20.0),
                                 category: category,
                                 brand: brand
  )
  if product.persisted?
    Comment.create(
      product: product,
      user: users.sample,
      rating: rand(1..5),
      body: Faker::Lorem.paragraph
    )

    puts "Generating image for #{product.name}"
    downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{product.name.split.last}")
    product.image.attach(io: downloaded_image, filename: "mi_#{product.id}.png")
  else
    puts "Failed to create product: #{product.errors.full_messages.join(', ')}"
  end
end


5.times do
  user = users.sample
  Order.create(state: rand(1..3), user: user)
  Payment.create(order: Order.last)
  Shipment.create(order: Order.last)
end


