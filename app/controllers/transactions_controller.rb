class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, except: :index
  before_action :set_investment, only: :sell
  before_action :set_all_transactions, only: :index
  before_action :set_stock_price, only: [:buy, :sell]
  before_action :new_transaction, only: [:buy, :sell]

  def index; end

  def buy
    @transaction_type = 'buy'
  end

  def sell
    @transaction_type = 'sell'
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html {
          redirect_to transactions_url,
          notice: 'Transaction was successful.'
        }
      else
        format.html { render :buy, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_investment
    @investment = current_user.investments
      .find_by(company_id: params[:company_id])
  end

  def new_transaction
    @transaction = current_user.transactions.build
  end

  def set_stock_price
    @stock_price = @company.prices.last.values[1]
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_all_transactions
    @transactions = current_user.transactions
      .order('created_at DESC')
  end

  def transaction_params
    params.require(:transaction).permit(
      :transaction_type, :stocks, :price,
      :user_id, :company_id
    )
  end
end
