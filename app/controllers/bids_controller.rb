class BidsController < ApplicationController
  before_action :set_bid, only: %i[ show edit update destroy ]

  # GET /bids or /bids.json
  def index
    @bids = Bid.all
    @bidding_items = Product.bidding
  end

  # GET /bids/1 or /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids or /bids.json
  def create
    service = BidPlacer.new(bid_params, current_user)
    product_id = bid_params[:product_id]

    respond_to do |format|
      if service.bid_placed?
        format.turbo_stream do
          render turbo_stream: [
            # turbo_stream.prepend("pay_order_modal_body", partial: "shared/success_message", locals: { message: "Payment successful!" }),
            turbo_stream.remove("place-bid-dialog-#{product_id}"),
            turbo_stream.update("flash", partial: "shared/flash", locals: { notice: "You have successfully placed your bid!" }),
            turbo_stream.update("bidding-item-#{product_id}", partial: "bids/bidding_item", locals: { product: Product.find(product_id) })
            # locals: { cash_change_amount: @payment.cash_change_amount }),
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend(
            "errors-container-#{product_id}", partial: "shared/error_message",
            locals: { message: service.error_messages.flatten.to_sentence }
          )
        end
      end
    end
  end

  # PATCH/PUT /bids/1 or /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to bid_url(@bid), notice: "Bid was successfully updated." }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1 or /bids/1.json
  def destroy
    @bid.destroy!

    respond_to do |format|
      format.html { redirect_to bids_url, notice: "bid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bid_params
      params.fetch(:bid, {})
    end
end
