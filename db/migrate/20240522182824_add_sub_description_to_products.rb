class AddSubDescriptionToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :sub_description, :string
  end
end
