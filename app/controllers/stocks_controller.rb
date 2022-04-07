class StocksController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  before_action :authenticate_user!
  before_action :set_stock, only: %i[show edit update destroy]

  def index
    @stocks = Stock.all
  end

  def show; end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:company_name, :price)
    end
end
