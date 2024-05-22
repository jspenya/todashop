class AddImageLinkToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :image_link, :string
  end
end
