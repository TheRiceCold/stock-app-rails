class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: :show
  before_action :set_prices, only: :prices
  before_action :set_last_change, only: :show
  before_action :set_current_last_price, only: :show

  def show; end

  def prices
    render json: @prices
  end

  private

  def set_prices
    @prices = Company.find(params[:company_id]).prices
  end

  def set_current_last_price
    @current_price = @company.prices.last.values[1]
    @last_price = @company.prices[3].values[0]
  end

  def set_last_change
    @last_change_date = @company.prices.last.values[23]
    @last_change_percent = @company.prices.last.values[20]
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
