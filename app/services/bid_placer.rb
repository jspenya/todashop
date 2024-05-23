class BidPlacer
  def initialize(bid_params = {}, user)
    @bid_params = bid_params
    @user = user
    @error_messages = []
  end

  attr_accessor :error_messages

  def bid_placed?
    save_transaction && save_bid
  end

  private

  def save_transaction
    t = Transaction.new(user: @user, product_id: @bid_params[:product_id])
    return true if t.save

    error_messages << t.errors.full_messages
    false
  end

  def save_bid
    bid = Bid.new(user: @user, product_id: @bid_params[:product_id], amount: @bid_params[:amount])

    return true if bid.save

    error_messages << bid.errors.full_messages
    false
  end
end
