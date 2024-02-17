class Admin::PaymentsController < ApplicationController
  def complete
    flash[:notice] = 'COMPLETE'
  end

  def fail
    flash[:alert] = 'FAIL'
  end

end
