class Admin::BrandsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_brand, only: %i[show edit update destroy]

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to admin_brands_path
      flash[:notice] = "Brand was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to admin_brands_path
      flash[:notice] = "Brand was been updated"
    else
      flash[:notice] = "Product was not been updated"
      redirect_to :edit
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = "Brand deleted successfully"
      redirect_to admin_brands_path
    end
  end



  private
  def find_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end
end
