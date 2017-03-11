class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |f|
    	f.integer :cart_id
    	f.integer :item_id
    	f.integer :quantity
    end
  end
end
