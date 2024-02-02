class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  enum state: {new: 1, failed: 2, completed: 3 }, _prefix: :state
end
