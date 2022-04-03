nasdaq_100 = [
  "AAPL", "ADBE", "ADI", "ADP", 
  "ADSK", "AEP", "ALGN", "AMAT", 
  "AMD", "AMGN", "AMZN", "ANSS", 
  "ASML", "ATVI", "AVGO", "BIDU", 
  "BIIB", "BKNG", "CDNS", "CDW", 
  "CERN", "CHKP", "CHTR", "CMCSA", 
  "COST", "CPRT", "CRWD", "CSCO", 
  "CSX", "CTAS", "CTSH", "DLTR", 
  "DOCU", "DXCM", "EA", "EBAY",
  "EXC", "FAST", "FB", "FISV", 
  "FOX", "FOXA", "GILD", "GOOG", 
  "GOOGL", "HON", "IDXX", "ILMN", 
  "INCY", "INTC", "INTU", "ISRG", 
  "JD", "KDP", "KHC", "KLAC", 
  "LRCX", "LULU", "MAR", "MCHP", 
  "MDLZ", "MELI", "MNST", "MRNA", 
  "MRVL", "MSFT", "MTCH", "MU", 
  "NFLX", "NTES", "NVDA", "NXPI", 
  "OKTA", "ORLY", "PAYX", "PCAR", 
  "PDD", "PEP", "PTON", "PYPL", 
  "QCOM", "REGN", "ROST", "SBUX", 
  "SGEN", "SIRI", "SNPS", "SPLK", 
  "SWKS", "TCOM", "TEAM", "TMUS", 
  "TSLA", "TXN", "VRSK", "VRSN", 
  "VRTX", "WBA", "WDAY", "XEL", 
  "XLNX", "ZM"
]

client = IEX::Api::Client.new

nasdaq_100.each do |symbol|
  Stock.create!(
    ticker: symbol,
    company_name: client.company(symbol).company_name,
    price: rand(10.0..1_1000.0),
    quantity: rand(100..100_000),
    logo: client.logo(symbol).url
  )
end
