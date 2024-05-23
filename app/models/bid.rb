# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  amount     :decimal(8, 2)
#  status     :integer          default("placed")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bids_on_product_id  (product_id)
#  index_bids_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  validate :amount_greater_than_current_highest_bid
  validate :amount_greater_than_product_price

  enum :status, { placed: 0, awarded: 1, lost: 2 }

  private

  def amount_greater_than_current_highest_bid
    return if product.blank?
    return if amount.blank?

    if amount <= product.bids.maximum(:amount).to_f
      errors.add(:amount, "must be greater than the current highest bid")
    end
  end

  def amount_greater_than_product_price
    return if product.blank?
    return if amount.blank?

    if amount <= product.price.to_f
      errors.add(:amount, "must be greater than or equal to product price")
    end
  end
end
