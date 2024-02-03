class Order < ApplicationRecord
  belongs_to :user
  #belongs_to :product

  enum state: { new: 'new', failed: 'failed', completed: 'completed' }, _suffix: :order


end
