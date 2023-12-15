class Product < ApplicationRecord
  has_one :promotion
  has_one :coupon, through: :promotion
  has_one :user, through: :coupon
  belongs_to :user
  has_one_attached :image
end
