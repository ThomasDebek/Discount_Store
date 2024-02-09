class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :find_category, only: %i[show edit update destroy ]
  def index
    @categories = Category.all
    @products = Product.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully!"
      redirect_to admin_categories_path
    else
      flash.now[:error] = "Failed to create category"
      render :new
    end

  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Product was successfully updated"
      redirect_to admin_products_path
    else
      render :edit
    end
  end


  def destroy
    @category.destroy
    flash[:success] = "Category deleted successfully"
    redirect_to admin_categories_path
  end



  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end


end
