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
    result = AddProductToCart.new.call(product_id: params[:product_id], cart: @cart)

    if result.success?
      flash[:notice] = result.value!
      redirect_to root_path
    else
      flash[:alert] = result.failure
      redirect_to root_path
    end
  end


  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart,{})
  end

end
