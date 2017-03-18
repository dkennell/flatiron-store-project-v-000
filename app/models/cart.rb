class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total 
    line_items_for_total = []
    self.line_items.each do |line_item|
      line_item.quantity.times do
        line_items_for_total << line_item
      end
    end
    prices_for_total = line_items_for_total.map {|line_item| line_item.item.price }
    return prices_for_total.sum
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.build(item_id: item_id, quantity: 1)
    end
    line_item
  end

  def checkout 
    self.line_items.each do |line_item|
      line_item.quantity.times do
        line_item.item.inventory -= 1
      end
      line_item.item.save
    end
    self.delete
  end

end
