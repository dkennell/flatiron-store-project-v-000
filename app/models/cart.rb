class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total 
    self.items.map(&:price).sum
  end

  def add_item(item_id)
  	binding.pry
  end

end
