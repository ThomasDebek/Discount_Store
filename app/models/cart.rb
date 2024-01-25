class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  delegate :empty?, to: :cart_items

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(product_id: product.id)
    end
    current_item
  end


  def total
    cart_items.inject(0) { |sum, item| item.total_price + sum }
  end


end
