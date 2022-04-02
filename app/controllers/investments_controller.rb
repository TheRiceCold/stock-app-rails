class InvestmentsController < ApplicationController
  before_action :set_investment, only: %i[show edit update destroy]

  def index
    @investments = Investment.all
  end

  def show; end

  def new
    @investment = Investment.new
  end

  def edit; end

  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      if @investment.save
        format.html { redirect_to investment_url(@investment), notice: "Investment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to investment_url(@investment), notice: "Investment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @investment.destroy

    respond_to do |format|
      format.html { redirect_to investments_url, notice: "Investment was successfully destroyed." }
    end
  end

  private
    def set_investment
      @investment = Investment.find(params[:id])
    end

    def investment_params
      params.require(:investment).permit(:user_id, :stock_id)
    end
end
