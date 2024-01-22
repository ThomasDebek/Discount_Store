class CartsController < ApplicationController
  before_action :authenticate_user!, only: [ :add , :destroy]
  before_action :initialize_cart
  def show
    @cart_items = @cart.cart_items.includes(:product, product: { image_attachment: :blob })
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    flash[:alert] = "Cart was successfully deleted"
    redirect_to root_path
  end

  def add
    product = Product.find(params[:product_id])
    item_added = @cart.add_product(product)
    if item_added.nil?
      flash[:notice] = "#{product.name} is already in the cart"
    else
      item_added.save
      flash[:notice] = "Added #{product.name} to the cart"
    end
    redirect_back(fallback_location: root_path)
  end


  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart,{})
  end

end
