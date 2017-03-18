class LineItemsController < ApplicationController

  def index

  end

  def create
    if current_user.current_cart
    	cart = current_user.current_cart
    else
    	cart = Cart.create(:user_id => current_user.id)    	
    end
    cart.status = "not submitted"
    LineItem.add_to_cart(params[:item_id], cart.id)
    cart.save
    current_user.current_cart = cart
    current_user.save
    redirect_to cart_path(cart)
  end

end
