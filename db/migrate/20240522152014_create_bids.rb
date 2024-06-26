class CreateBids < ActiveRecord::Migration[7.1]
  def change
    create_table :bids do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
