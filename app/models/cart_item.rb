class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validates_numericality_of :quantity, greater_than_or_equal_to: 1, less_than_or_equal_to: 5


  def total_price
    quantity * product.price
  end

end
