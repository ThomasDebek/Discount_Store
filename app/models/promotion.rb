class Promotion < ApplicationRecord
  belongs_to :product
  belongs_to :coupon

  delegate :user, to: :coupon, allow_nil: true
end
