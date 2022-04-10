module TransactionsHelper
  def company_name_by_id stock_id
    Stock.find(stock_id).company_name
  end

  def logo_by_id stock_id
    Stock.find(stock_id).logo_url
  end
end
