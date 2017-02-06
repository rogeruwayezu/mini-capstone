class OrdersController < ApplicationController
  def create
    quantity = params[:quantity]
    order = Order.new({quantity: quantity, user_id: current_user.id})
    order.save
    flash[:info] = "Successfully ordered"
    redirect_to "/orders/#{order.id}"
  end
  def show
    @order = Order.find_by(id: params[:id])
  end
  def index
    @orders = Order.all
    render "index.html.erb"
  end
end
