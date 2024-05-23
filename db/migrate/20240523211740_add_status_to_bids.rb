class AddStatusToBids < ActiveRecord::Migration[7.1]
  def change
    add_column :bids, :status, :integer, default: 0
  end
end
