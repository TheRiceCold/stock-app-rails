# Reference
# https://github.com/dblock/iex-ruby-client

class ClientService
  # Symbols(Ticker)
  def self.get_symbols
    client.ref_data_symbols
  end

  # Stock Quote
  def self.get_latest_price(symbol)
    client.quote(symbol).latest_price
  end

  # OHLC (Open, High, Low, Close) price
  def self.get_ohlc(symbol)
    client.ohlc(symbol)
  end

  # Historical Prices
  def self.get_prices(symbol)
    # One month of data
    client.historical_prices(symbol)
  end

  def self.get_all_prices(symbol)
    # All data up to 15 years
    client.historical_prices(symbol, {range: 'max'})
  end

  def self.get_current_year_prices(symbol)
    # Year to date data
    client.historical_prices(symbol, {range: 'ytd'})
  end

  def self.get_year_prices(symbol, year)
    # 5 years of data
    client.historical_prices(symbol, {range: "#{year}y"})
  end

  # Company Information
  def self.get_company_name(symbol)
    client.company(symbol).company_name
  end

  # Company Logo
  def self.get_logo(symbol)
    client.logo(symbol).url
  end

  private 
  def self.client
    @client = IEX::Api::Client.new
  end

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
