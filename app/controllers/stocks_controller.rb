class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only: :show
  before_action :set_all_stocks, only: :index

  def index; end

  def show
    @transaction = current_user.transactions.build
  end

  private
  def set_all_stocks
    GetStocksJob.perform_later

    @stocks = Stock.all
  end

  def set_stock
    @stock = Stock.find params[:id]
  end
end
