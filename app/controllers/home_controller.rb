class HomeController < ApplicationController
  before_action :initialize_cart
  def index
    @products = Product.page(params[:page])

    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?

    @show_sidebar = true
  end
end
