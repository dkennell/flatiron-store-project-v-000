class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def self.add_to_cart(cart_id, item_id)
  	if LineItem.all.any? { |line_item| line_item.item_id == item_id && line_item.cart_id == cart_id }
        a = LineItem.find_by(:item_id => item_id, :cart_id => cart_id)
        a.quantity += 1
        a.save
    else
  	    a = LineItem.create(item_id: item_id, cart_id: cart_id, quantity: 1)
  	    a.save
    end
  end

end
