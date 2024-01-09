class HomeController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 6)

    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?

    @coupons = Coupon.all
    @promotions = Promotion.includes(:product, :coupon).all
    @show_sidebar = true
  end
end
