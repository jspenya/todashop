class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]

  def index
    @transactions = Transaction.all
  end

  def show; end

  def pay
    Transaction.create!(product_id: params[:product_id], user_id: current_user.id)
  end

  private

  def set_transaction
    @transaction = Transaction.find_by_id(params[:id])
  end
end
