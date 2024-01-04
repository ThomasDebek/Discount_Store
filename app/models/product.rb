class Product < ApplicationRecord
  has_one :promotion
  has_one :coupon, through: :promotion
  has_one :user, through: :coupon
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :brand

  scope :filter_by_category, proc { |category_id| where(category_id: category_id) }
  scope :filter_by_brand, proc { |brand_id| where(brand_id: brand_id )}



end
