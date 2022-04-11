Stock.destroy_all

# april 3, 2022
# nasdaq.com/market-activity/quotes/nasdaq-ndx-index

nasdaq_100 = [
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
  'HON', 'IDXX', 'ILMN', 'INCY',
  'INTC', 'INTU', 'ISRG', 'JD',
  'KDP', 'KHC', 'KLAC', 'LRCX',
  'LULU', 'MAR', 'MCHP', 'MDLZ',
  'MELI', 'MNST', 'MRNA', 'MRVL',
  'MSFT', 'MTCH', 'MU', 'NFLX',
  'NTES', 'NVDA', 'NXPI', 'ODFL',
  'OKTA', 'ORLY', 'PANW', 'PAYX',
  'PCAR', 'PDD', 'PEP', 'PYPL',
  'QCOM', 'REGN', 'ROST', 'SBUX',
  'SGEN', 'SIRI', 'SNPS', 'SPLK',
  'SWKS', 'TEAM', 'TMUS', 'TSLA',
  'TXN', 'VRSK', 'VRSN', 'VRTX',
  'WBA', 'WDAY', 'XEL', 'ZM', 'ZS'
]

api = IEX::Api::Client.new
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

nasdaq_100.each do |s|
  Stock.create!(
    symbol: s,
    logo_url: api.logo(s).url,
    company_name: api.company(s).company_name,
    latest_price: api.quote(s).latest_price,
    quantity: rand(100..100_000),
    market_cap: api.key_stats(s).market_cap
  )
end
