class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |f|
      f.string :name
      f.integer :current_cart_id
    end
  end
end
