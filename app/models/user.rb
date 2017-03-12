class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

class User < ActiveRecord::Base
  has_secure_password
  has_many :carts

  def current_cart
  	Cart.find_by(id: session[:cart_id])
  end
  
end


end
