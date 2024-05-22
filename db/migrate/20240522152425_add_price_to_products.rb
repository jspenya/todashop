class AddPriceToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
  end
end
