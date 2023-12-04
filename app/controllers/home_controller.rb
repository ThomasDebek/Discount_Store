class HomeController < ApplicationController
  def index
    @products = Product.all
    @coupons = Coupon.all
    @promotions = Promotion.includes(:product, :coupon).all
  end
end
