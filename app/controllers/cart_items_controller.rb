class CartItemsController < ApplicationController
  before_action :initialize_cart, only: %i[create update destroy]
  before_action :set_cart_item, only: %i[update destroy]
  before_action :find_product, only: %i[create]
  before_action :authenticate_user!

  def create
    cart_item = AddProduct.new.call(product: @product, cart: @cart)
    if cart_item.quantity > 5
      flash[:notice] = 'your basket may only have five products'
      redirect_to root_path
    else
      cart_item.save
      flash[:notice] = 'Your cart is update'
      redirect_to @cart
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart, flash: { notice: 'Your cart is update' }
    else
      redirect_to @cart, flash: { error: 'Your input is invalid' }
    end
  end

  def destroy
    DestroyCartItem.new.call(cart_item: @cart_item)
    redirect_to @cart
  end

  private
  def find_product
    @product = Product.find(params[:product_id])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :cart_id )
  end


end
