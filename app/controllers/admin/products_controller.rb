class Admin::ProductsController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!
  before_action :find_product, only: %i[edit update destroy]

  def index
    @products = Product.all
    @products = @products.filter_by_category(params[:category]) if params[:category].present?
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
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

  def new
    @product = Product.new
  end

  def edit
  end

  def update

    if @product.update(product_params)
      flash[:notice] = "Product was successfully updated"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy

    if @product.destroy
      redirect_to admin_products_path
      flash[:notice] = "Product was been deleted"
    else
      flash[:alert] = "Something is wrong"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image, :brand_id, :category_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
