class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  enum state: { new: 1, failed: 2, completed: 3}, _prefix: :state
  has_one :payment, dependent: :destroy

  def total
    order_items.inject(0) { |sum, item| item.total_price + sum }
  end

end




