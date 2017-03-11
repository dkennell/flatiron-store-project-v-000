class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |f|
      f.string :name
      f.string :email
      f.string :password_digest
      f.integer :current_cart_id
    end
  end
end
