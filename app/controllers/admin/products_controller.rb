class Admin::ProductsController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!
  def index
    @products = Product.all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product added successfully"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image, :brand_id, :category_id)
  end

end
