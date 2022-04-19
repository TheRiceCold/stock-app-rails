class Transaction < ApplicationRecord
  belongs_to :user

  enum transaction_type: [:buy, :sell]

  # default_scope { order(created_at: :desc) }

  validates_presence_of :transaction_type, :stocks, :total_cost
  validates :stocks, numericality: { greater_than: 0 }
  validate :sufficient_balance

  before_save :save_total_cost
  after_create :update_wallet

  private

  # company and stocks
  def get_company = Company.find(self.company_id)
  def stock_price = get_company.prices.last.values[1]
  def total_stocks_cost = self.stocks.to_d * stock_price.to_d
  def shares = self.stocks * 100 / get_company.stocks

  # investments
  def investment_exist? = user.investments.exist?(company_id: self.company_id)
  def get_investment = user.investments.find(company_id: self.company_id)

  # validations
  def sufficient_balance
    if transaction_type == 'buy' and user.wallet < total_cost
      errors.add(:stocks, 'insufficient balance')
    end
  end

  # before create
  def save_total_cost
    self.total_cost = total_stocks_cost
  end

  #after create
  def update_wallet
    case transaction_type
    when 'buy'
      user.wallet -= total_cost
    when 'sell'
      user.wallet += total_cost
    end
    user.save
  end

  def add_to_investments
    if investment_exist?
      case self.transaction_type
      when 'buy'
        get_investment.quantity += self.quantity
      when 'sell'
        get_investment.quantity -= self.quantity
      end
    else
      get_user.investment.build(
        quantity: self.quantity,
        stock_id: self.stock_id
      )
    end
  end
end
