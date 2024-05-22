# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  image_link      :string
#  name            :string
#  price           :decimal(8, 2)
#  sub_description :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  game_id         :bigint           not null
#
# Indexes
#
#  index_products_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
