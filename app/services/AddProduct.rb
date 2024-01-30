class AddProduct
  def call(product:, cart:)
    cart_item = cart.add_product(product)
    cart_item
  end
end