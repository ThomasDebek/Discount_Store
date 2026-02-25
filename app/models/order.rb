class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  has_one :payment, dependent: :destroy
  has_one :shipment, dependent: :destroy

  enum :state, [:pending, :failed, :completed], prefix: true



  def total
    order_items.inject(0) { |sum, item| item.total_price + sum }
  end

end




