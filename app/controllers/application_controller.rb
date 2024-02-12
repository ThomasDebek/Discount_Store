class ApplicationController < ActionController::Base

  include Pagy::Backend

  def initialize_cart
    @cart = if session[:cart_id].present?
              Cart.find_by(id: session[:cart_id]) || Cart.create
            else
              Cart.create
            end
    session[:cart_id] ||= @cart.id
  end

end
