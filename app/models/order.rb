class Order < ApplicationRecord
  belongs_to :user
  #belongs_to :product

  enum state: { new: 1, failed: 2, completed: 3 }, _prefix: :state


end
