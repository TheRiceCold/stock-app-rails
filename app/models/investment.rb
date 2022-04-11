class Investment < ApplicationRecord
  belongs_to :user
  has_many :stocks

  validates :stock_id, uniqueness: true

  private
  #getters
  def get_stock = Stock.find(self.stock_id)
  def get_user = User.find(self.user_id)

  def total_shares = (self.quantity / get_stock.quantity) * 100

  #before_save
end
