class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: :show
  before_action :set_all_transactions, only: :index

  def index; end
  def show; end

  def create
    transaction = Transaction.new transaction_params

    if transaction.save
      flash.notice = "Transaction was successfully created."
    else
      flash.alert = "Transaction failed."
    end

    redirect_to transactions_url
  end

  private

  def set_all_transactions
    @transactions = Transaction.all
  end

  def set_transaction
    @transaction = Transaction.find params[:id]
  end

  def transaction_params
    params.require(:transaction).permit(
      :transaction_type, :quantity,
      :total_cost, :user_id, :stock_id
    )
  end
end
