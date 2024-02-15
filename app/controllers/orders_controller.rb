class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart
  def create
    result = CreateOrder.new.call(cart: @cart, user: current_user)

    if result.success?
      flash[:notice] = result.value!
      redirect_to root_path
    else
      flash[:alert] = result.failure
      redirect_to cart_path
    end
  end

end
