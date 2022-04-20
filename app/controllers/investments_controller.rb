class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_investments, only: :index

  def index; end
  def show; end

  def destroy
    @investment.destroy
    # render :index
  end

  private

  def set_user_investments
    @investments = current_user.investments
  end
end
