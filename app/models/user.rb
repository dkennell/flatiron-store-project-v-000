class User < ActiveRecord::Base
  has_secure_password
  has_many :carts

  def current_cart
  	Cart.find_by(id: session[:cart_id])
  end
  
end