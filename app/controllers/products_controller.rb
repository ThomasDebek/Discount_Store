# app/controllers/products_controller.rb

class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_product, only: %i[show edit update destroy]

  def show
    @comments = @product.comments.order(created_at: :desc)
    @show_sidebar = false
  end

  def search
    @products = SearchProduct.new.call(params[:q]).paginate(page: params[:page], per_page: 6)
    if @products.empty?
      flash[:notice] = 'There is no product you are looking for, please try again '
      redirect_back(fallback_location: root_path) unless @products.any?
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update(product_params)
      redirect_to root_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy

    redirect_to root_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end
end
