class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :find_order, only: %i[destroy show]
  def index
    @pagy, @orders = pagy(Order.all, items: 4)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end

  def destroy
    @order.destroy
    flash[:notice] = "Order was been deleted"
    redirect_to admin_orders_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:name)
  end

end
