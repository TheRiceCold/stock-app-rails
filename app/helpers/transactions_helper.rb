module TransactionsHelper
  def find_company_by_id(id)
    Company.find(id).name
  end

  def find_logo_by_id(id)
    Company.find(id).logo_url
  end

  def transaction_content(transaction)
    stocks = transaction.stocks
    transaction_type = transaction.transaction_type
    company = find_company_by_id transaction.company_id
    total_cost = number_to_currency transaction.total_cost

    buy_or_sell = transaction_type == 'buy' ? 'Bought' : 'Sold'
    stocks_content = stocks.to_s + " #{stocks > 1 ? 'stocks' : 'stock'}"
    cost_or_earned = transaction_type == 'buy' ? 'cost' : 'earned'
    date = transaction.created_at

    content = "#{buy_or_sell} #{stocks_content} from #{company}"
    total_cost_content = "Total #{cost_or_earned}: #{total_cost}"
    date_content = date.strftime('%m/%d/%Y') + ' at ' + date.strftime('%I:%M %p')

    if transaction_type == 'buy'
      content_tag :li, class: ['transaction', 'buy'] do
        content_tag(:h5, content) +
        content_tag(:div) do
          content_tag(:p, total_cost_content) +
          content_tag(:p, date_content)
        end
      end
    else
      content_tag :li, class: ['transaction', 'sell'] do
        contents.each do |item|
          concat content_tag(:h5, item)
        end
      end
    end
  end


end
