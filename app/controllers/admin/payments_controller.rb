class Admin::PaymentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_payment, only: %i[complete fail]

  def complete
    if StateService.new(@payment).complete!
      flash[:notice] = 'Payment completed'
    else
      flash[:alert] = 'Can\'t complete payment'
    end
    redirect_to admin_order_path(@payment.order)
  end

  def fail
    if StateService.new(@payment).fail!
      flash[:notice] = 'Payment failed'
    else
      flash[:alert] = 'Can\'t fail payment'
    end
    redirect_to admin_order_path(@payment.order)
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end


end
