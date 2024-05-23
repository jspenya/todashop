class AddIsBiddingToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :is_bidding, :boolean, default: false
  end
end
