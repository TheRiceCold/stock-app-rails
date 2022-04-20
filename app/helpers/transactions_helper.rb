module TransactionsHelper

  def transaction_content(transaction)
    company_id = transaction.company_id
    stocks = transaction.stocks
    price = transaction.price
    transaction_type = transaction.transaction_type
    company = Company.find(company_id).name
    total_cost = number_to_currency(price * stocks)

    buy_or_sell = transaction_type == 'buy' ? 'Bought' : 'Sold'
    stocks_content = stocks.to_s + " #{stocks > 1 ? 'stocks' : 'stock'}"
    cost_or_earned = transaction_type == 'buy' ? 'cost' : 'earned'
    date = transaction.created_at

    content = "#{buy_or_sell} #{stocks_content} from "
    total_cost_content = "Total #{cost_or_earned}: #{total_cost}"
    date_content = date.strftime('%B %d, %Y') + date.strftime(' at %I:%M %p')

    if transaction_type == 'buy'
      tag.li class: %w(transaction buy) do
        tag.h5 do
          tag.span(content) +
          link_to(company, company_path(company_id))
        end +
        tag.div do
          content_tag(:p, total_cost_content) +
          tag.p(date_content)
        end
      end
    else
      tag.li class: %w(transaction sell) do
        tag.h5 do
          tag.span(content) +
          link_to(company, company_path(company_id))
        end +
        tag.div do
          content_tag(:p, total_cost_content) +
          tag.p(date_content)
        end
      end
    end
  end

end
