class CartsController < ApplicationController

  def show
	@cart = Cart.find_by(id: params[:id])
  end

  def checkout
  	@cart = Cart.find_or_create_by(id: params[:id])
  	@cart.status = "submitted"
  	@cart.checkout
  	@cart.status = "not submitted"
  	@cart.save
    redirect_to cart_path(@cart)
  end

end
