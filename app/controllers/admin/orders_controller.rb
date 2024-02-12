class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :find_order, only: %i[destroy]
  def index
    @orders = Order.order(created_at: :desc)
  end

  def destroy
    @order.destroy
    flash[:notice] = "Order was been deleted"
    redirect_to admin_order_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:name)
  end

end
