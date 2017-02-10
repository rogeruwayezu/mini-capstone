class CartedProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @order = current_user.orders.find_by(completed: false)
  end
  def create
    order = current_user.orders.find_by(completed: false) || Order.create(user_id: current_user.id, completed: false)
      carted_product = CartedProduct.new({quantity: params[:quantity], order_id: order.id, product_id: params[:product_id]})
      carted_product.save
      redirect_to "/carted_products"
  end
  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.destroy
    flash[:warning] = "Product removed from shopping cart"
    redirect_to "/carted_products"
  end
end
