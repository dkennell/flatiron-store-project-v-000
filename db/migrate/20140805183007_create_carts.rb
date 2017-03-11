class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |f|
    	f.integer :user_id
    	f.string :status
    end
  end
end
