class Admin::OrdersController < ApplicationController
  layout 'admin'
  def index
    @orders = Order.order(created_at: :desc)
  end
end
