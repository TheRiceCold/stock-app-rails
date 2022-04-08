class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only: %i[show edit update destroy]
  before_action :set_all_stocks, only: :index
  before_action :set_user_investment, only: :show

  def index; end
  def show; end
  def buy; end

  private
    def set_all_stocks
      @stocks = Stock.all
    end

    def set_user_investment
      @user = User.find(current_user.id)
      @investment = @user.investments.build
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:company_name, :price)
    end
end
