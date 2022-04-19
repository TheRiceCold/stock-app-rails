# Reference
# https://github.com/dblock/iex-ruby-client

class FetchCompaniesJob < ApplicationJob
  queue_as :default

  def perform
    Money.rounding_mode = BigDecimal::ROUND_HALF_UP
    create_companies
  end

  def create_companies
    nasdaq_100.each do |s|
      name = get_name(s)
      logo = get_logo(s)
      prices = get_prices(s)
      cap = get_market_cap(s)
      stocks = rand(100..100_000)

      next if Company.exists?(name: name)
      create_company(s, name, logo, stocks, prices, cap)
    end
  end

  def create_company(symbol, name, logo, stocks, prices, cap)
    Company.create!(
      ticker: symbol, name: name,
      logo_url: logo, stocks: stocks,
      prices: prices, market_cap: cap
    )
  end

  def get_name(symbol)
    client.company(symbol).company_name
  end

  def get_logo(symbol)
    client.logo(symbol).url
  end

  # Historical Prices
  def get_prices(symbol)
    # 1 week of data
    client.historical_prices(symbol, {range: '7d'})
  end

  def get_market_cap(symbol)
    client.key_stats(symbol).market_cap
  end

  def client
    IEX::Api::Client.new
  end

  # april 3, 2022
  # nasdaq.com/market-activity/quotes/nasdaq-ndx-index

  def nasdaq_100 = [
    'AAPL', 'ABNB', 'ADBE', 'ADI',
    'ADP', 'ADSK', 'AEP', 'ALGN',
    'AMAT', 'AMD', 'AMGN', 'AMZN',
    'ANSS', 'ASML', 'ATVI', 'AVGO',
    'AZN', 'BIDU', 'BIIB', 'BKNG',
    'CDNS', 'CEG', 'CHTR', 'CMCSA',
    'COST', 'CPRT', 'CRWD', 'CSCO',
    'CSX', 'CTAS', 'CTSH', 'DDOG',
    'DLTR', 'DOCU', 'DXCM', 'EA',
    'EBAY', 'EXC', 'FAST', 'FB',
    'FISV', 'FTNT', 'GILD', 'GOOG',
    'GOOGL', 'HON', 'IDXX', 'ILMN',
    'INCY', 'INTC', 'INTU', 'ISRG',
    'JD', 'KDP', 'KHC', 'KLAC',
    'LRCX', 'LULU', 'MAR', 'MCHP',
    'MDLZ', 'MELI', 'MNST', 'MRNA',
    'MRVL', 'MSFT', 'MTCH', 'MU',
    'NFLX', 'NTES', 'NVDA', 'NXPI',
    'ODFL', 'OKTA', 'ORLY', 'PANW',
    'PAYX', 'PCAR', 'PDD', 'PEP',
    'PYPL', 'QCOM', 'REGN', 'ROST',
    'SBUX', 'SGEN', 'SIRI', 'SNPS',
    'SPLK', 'SWKS', 'TEAM', 'TMUS',
    'TSLA', 'TXN', 'VRSK', 'VRSN',
    'VRTX', 'WBA', 'WDAY',
    'XEL', 'ZM', 'ZS'
  ]

  # Too much symbols
  # def get_symbols
  #   data = client.ref_data_symbols
  #
  #   data.map do |item|
  #     if item.has_key?('symbol')
  #       item.symbol
  #     end
  #   end
  # end


  # # Stock Quote
  # def self.get_latest_price(symbol)
  #   client.quote(symbol).latest_price
  # end
  #
  # # OHLC (Open, High, Low, Close) price
  # def self.get_ohlc(symbol)
  #   client.ohlc(symbol)
  # end
  #
  # def self.get_all_prices(symbol)
  #   # All data up to 15 years
  #   client.historical_prices(symbol, {range: 'max'})
  # end
  #
  # def self.get_current_year_prices(symbol)
  #   # Year to date data
  #   client.historical_prices(symbol, {range: 'ytd'})
  # end
  #
  # def self.get_year_prices(symbol, year)
  #   # 5 years of data
  #   client.historical_prices(symbol, {range: "#{year}y"})
  # end
  #
  # # Company Information
  # def self.get_company_name(symbol)
  #   client.company(symbol).company_name
  # end
  #
  # private 
  # def self.client
  #   @client = IEX::Api::Client.new
  # end

  # client.historical_prices(symbol, {range: '6m'}) # 6 months of data
  # client.historical_prices(symbol, {range: '5d'}) # 5 days of data
  # client.historical_prices(symbol, { range: 'date', date: Date.parse('2020-09-30'), chartByDay: 'true' }) # one day of data

  # Recent News
  # client.news(symbol)
  # client.news(symbol, 5) # range between 1 and 50

  # Chart
  # client.chart(symbol)

  # Key Stats
  # client.key_stats(symbol)

  # Advance Stats
  # client.advance_stats(symbol)

  # Dividends
  # dividends = client.dividends('MSFT', '6m') # Options are: 5y, 2y, 1y, ytd, 6m, 3m, 1m

  # Earnings 
  # client.earnings(symbol)

  # Income Statement
  # client.income(symbol)

  # Balance Sheet
  # client.balance_sheet(symbol)

  # Cash Flow Statement
  # client.cash_flow(symbol)

  # Sector Performance
  # client.sectors(symbol)

  # Largest Trades
  # client.largest_trades(symbol)

  # Quote for Crypto Currencies
  # client.crypto('BTCUSDT')
end
