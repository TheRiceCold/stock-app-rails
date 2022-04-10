class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_stocks, only: :index
  before_action :set_stock, only: :show

  def index; end

  def show
    @transaction = current_user.transactions.build
  end

  private
  def set_all_stocks
    @stocks = Stock.all
  end

  def set_stock
    @stock = Stock.find params[:id]
  end
end
