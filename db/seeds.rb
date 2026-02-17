p "Delete all Data Base and create new...."

Payment.delete_all
Shipment.delete_all
OrderItem.delete_all
Order.delete_all

Comment.delete_all
CartItem.delete_all
Cart.delete_all

Product.delete_all
Brand.delete_all
Category.delete_all
User.delete_all
Admin.delete_all

require 'faker'
require 'open-uri'
require 'securerandom'

Admin.create(email: "admin@gmail.com", password: "secret")

10.times do
  email_prefix = Faker::Name.first_name.downcase
  User.create(email: "#{email_prefix}@gmail.com", password: 'secret')
end

dave_user = User.create(email: 'dave@gmail.com', password: 'secret')

users = User.all

4.times { Category.create(name: Faker::Commerce.department(max: 1)) }
categories = Category.all

4.times { Brand.create(name: Faker::Device.manufacturer) }
brands = Brand.all

25.times do
  user = users.sample
  category = categories.sample
  brand = brands.sample
  product = user.products.create(
    name: Faker::Food.ingredient,
    price: Faker::Commerce.price(range: 5..20.0),
    category: category,
    brand: brand
  )

  if product.persisted?
    Comment.create(product: product, user: users.sample, rating: rand(1..5), body: Faker::Lorem.paragraph)

    begin
      seed = product.name.downcase.gsub(/\s+/, "_")
      image_url = "https://picsum.photos/700/400?seed=#{seed}#{SecureRandom.uuid}"
      downloaded_image = URI.open(image_url, read_timeout: 5)

      filename = "product_#{product.id}.jpg"
      puts "✅ Tworzę obrazek dla #{product.name}, plik: #{filename}"

      product.image.attach(io: downloaded_image, filename: filename, content_type: "image/jpeg")
    rescue => e
      puts "⚠️ Image skipped for #{product.name}: #{e.message}"
    end
  end
end

5.times do
  user = users.sample
  order = Order.create(
    user: user,
    state: Order.states.keys.sample  # <-- używamy enum dopasowanego do 'state'
  )

  Payment.create(order: order)
  Shipment.create(order: order)
end