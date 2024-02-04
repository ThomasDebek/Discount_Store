class Admin::ProductsController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!
  def index
    " PANEL ADMIN"

    @products = Product.order(created_at: :desc).paginate(page: params[:page], per_page: 6)

    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?

    @show_sidebar = true
  end

end
