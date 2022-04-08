class Transaction < ApplicationRecord
  belongs_to :user
  validates :quantity, numericality: { greater_than: 0 }
  # validates :total_cost, numericality: { greater_than: 0 }
  enum transaction_type: [:buy, :sell]

  before_save :compute_total_cost


  def update_stock_qty
    stock = Stock.find self.stock_id

    case self.transaction_type
    when transaction_type.buy
      updated_qty = self.quantity - stock.quantity
    when transaction_type.sell
      updated_qty = self.quantity + stock.quantity
    end

    stock.update(quantity: updated_qty)
  end

  def compute_total_cost
    price = Stock.find(self.stock_id).latest_price
    self.total_cost = self.quantity.to_d * price.to_d
  end
end
