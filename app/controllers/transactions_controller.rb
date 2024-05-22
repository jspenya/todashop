class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]

  def index
    @transactions = Transaction.all
  end

  def show; end

  def pay
    # Transaction.create!
  end

  private

  def set_transaction
    @transaction = Transaction.find_by_id(params[:id])
  end

  def transaction_params
    params.require(:product).permit(:name, :price, :game_id, :qrcode)
  end
end
