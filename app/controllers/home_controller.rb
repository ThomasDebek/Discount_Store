class HomeController < ApplicationController
  before_action :initialize_cart
  def index
    @products = Product.order(created_at: :desc).paginate(page: params[:page], per_page: 6)

    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?

    @show_sidebar = true
  end
end
