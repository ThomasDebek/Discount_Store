# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
Coupon.destroy_all
Promotion.destroy_all
User.destroy_all
Brand.destroy_all
Category.destroy_all


# db/seeds.rb
require 'faker'
require 'open-uri'

# Create regular users
10.times do
  User.create(email: Faker::Internet.email, password: 'password123')
end

# Get two random users
user1 = User.all.sample
user2 = (User.all - [user1]).sample

# Generate Coupons for the selected users
coupon1 = Coupon.create(code: Faker::Alphanumeric.alphanumeric(number: 8), discount: 15, user: user1)

coupon2 = Coupon.create(code: Faker::Alphanumeric.alphanumeric(number: 8), discount: 20, user: user2)

# Create a fixed user "Dave"
dave_user = User.create(email: 'dave@gmail.com', password: 'secret')

# Generate a Coupon for Dave
dave_coupon = Coupon.create(code: Faker::Alphanumeric.alphanumeric(number: 8), discount: 10, user: dave_user)

# Generate Products and Promotions
users = User.all

# Zaktualizuj generowanie produktów
users = User.all



Category.destroy_all
4.times do
  Category.create(
    name: Faker::Commerce.department(max: 1)
  )
end

Brand.destroy_all
4.times do
  Brand.create(
    name: Faker::Device.manufacturer
  )
end

categories = Category.all
brands = Brand.all



5.times do
  # Wybierz losowego użytkownika
  user = users.sample
  category = categories.sample
  brand = brands.sample
  product = user.products.create(name: Faker::Food.dish,
                                 price: Faker::Commerce.price(range: 5..20.0),
                                 category: category,
                                 brand: brand
  )
  if product.persisted?
    Promotion.create(product: product, coupon: Coupon.all.sample)
    puts "Generating image for #{product.name}"
    downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{product.name.split.last}")
    product.image.attach(io: downloaded_image, filename: "mi_#{product.id}.png")
  else
    puts "Failed to create product: #{product.errors.full_messages.join(', ')}"
  end
end
