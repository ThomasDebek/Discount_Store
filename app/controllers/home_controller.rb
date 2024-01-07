class HomeController < ApplicationController
  def index
    @products = Product.all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?

    @coupons = Coupon.all
    @promotions = Promotion.includes(:product, :coupon).all
  end
end
