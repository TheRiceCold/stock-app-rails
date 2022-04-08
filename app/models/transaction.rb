class Transaction < ApplicationRecord
  belongs_to :user
  validates :quantity, numericality: { greater_than: 0 }
  # validates :total_cost, numericality: { greater_than: 0 }
  before_save :compute_total_cost

  def compute_total_cost
    price = Stock.find(self.stock_id).latest_price
    self.total_cost = self.quantity.to_d * price.to_d
  end
end
