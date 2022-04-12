class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_current_last_price

  def show
    @transaction = current_user.transactions.build
  end

  private
  def set_company
    FetchCompaniesJob.set(wait: 1.week).perform_later
    @company = Company.find(params[:id])
  end

  def set_current_last_price
    @current_price = @company.prices.last.values[1]
    @last_price = @company.prices[3].values[0]
  end
end
