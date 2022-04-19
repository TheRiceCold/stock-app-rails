class Transaction < ApplicationRecord
  belongs_to :user

  enum transaction_type: [:buy, :sell]

  # default_scope { order(created_at: :desc) }

  validates_presence_of :transaction_type, :stocks
  validates :stocks, numericality: { greater_than: 0 }
  validate :sufficient_balance

  before_save :create_investment
  # after_save :update_investment
  after_save :update_balance

  private

  # company and stocks
  def get_company = Company.find(self.company_id)
  def total_cost = self.stocks.to_d * price.to_d
  def shares = self.stocks * 100 / get_company.stocks

  # investments
  def investment_exist? = user.investments.exists?(company_id: self.company_id)
  def user_investment = user.investments.find(company_id: self.company_id)

  # validations
  def sufficient_balance
    if transaction_type == 'buy' and user.balance.to_d < total_cost.to_d
      errors.add(:stocks, 'insufficient balance')
    end
  end

  # before save
  def create_investment
    unless investment_exist?
      user.investments.build(
        stocks: self.stocks,
        company_id: self.company_id
      )
    end
  end
  
  # # after save
  # def update_investment
  #   if investment_exist?
  #     case self.transaction_type
  #     when 'buy'
  #       user_investment.stocks += self.stocks
  #     when 'sell'
  #       user_investment.stocks -= self.stocks
  #     end
  #     user_investment.save
  #   end
  # end

  def update_balance
    case transaction_type
    when 'buy'
      user.balance -= total_cost
    when 'sell'
      user.balance += total_cost
    end
    user.save
  end
end
