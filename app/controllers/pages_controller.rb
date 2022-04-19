class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_companies, only: :stock_market

  def home; end
  def stock_market; end

  private 
  def set_companies
    # FetchCompaniesJob.set(wait: 1.week).perform_later
    @companies = Company.all
  end
end
