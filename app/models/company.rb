class Company < ApplicationRecord
  has_many :investments

  validates_presence_of :ticker,
    :name, :logo_url,
    :stocks, :prices

  validates_uniqueness_of :ticker

end
