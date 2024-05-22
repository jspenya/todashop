# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
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
end
