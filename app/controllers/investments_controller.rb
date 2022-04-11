class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_investments, only: :index

  def index
  end

  private

  def set_all_investments
    @investments = current_user.investments
  end
end
