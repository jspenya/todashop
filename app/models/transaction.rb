# == Schema Information
#
# Table name: transactions
#
#  id         :bigint           not null, primary key
#  status     :integer          default("on_hold")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_transactions_on_product_id  (product_id)
#  index_transactions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum :status, { on_hold: 0, successful: 1, failed: 2 }
end
