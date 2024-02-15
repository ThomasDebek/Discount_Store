class Product < ApplicationRecord
  include PgSearch::Model

 
  belongs_to :user, optional: true

  has_one_attached :image
  has_many :comments, dependent: :destroy

  belongs_to :category
  belongs_to :brand

  scope :filter_by_category, proc { |category_id| where(category_id: category_id) }
  scope :filter_by_brand, proc { |brand_id| where(brand_id: brand_id )}

  pg_search_scope :search_by_name, against: :name, using: { dmetaphone: {}, trigram: {}, tsearch: { prefix: true, any_word: true } }

  acts_as_votable

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy


  def main_image_path
    image.attached? ? image : 'main_image_placeholder.png'
  end


end
