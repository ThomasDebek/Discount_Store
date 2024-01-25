
class DestroyCartItem
  def call(cart_item:)
    if cart_item.quantity > 1
      cart_item.quantity -= 1
      cart_item.save
    else
      cart_item.destroy
    end
  end
end