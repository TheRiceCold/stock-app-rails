class Company < ApplicationRecord
  validates_uniqueness_of :ticker
  # has_many :transactions
end
