class AddAmountToBids < ActiveRecord::Migration[7.1]
  def change
    add_column :bids, :amount, :decimal, :precision => 8, :scale => 2
  end
end
