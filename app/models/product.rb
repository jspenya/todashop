# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  image_link      :string
#  is_bidding      :boolean          default(FALSE)
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
class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :game
  has_many :transactions, dependent: :destroy
  has_many :bids, dependent: :destroy

  after_commit :generate_qrcode, on: :create

  scope :bidding, -> { where(is_bidding: true)}
  scope :not_bidding, -> { where(is_bidding: false)}
end
