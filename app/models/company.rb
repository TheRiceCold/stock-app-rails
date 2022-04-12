class Company < ApplicationRecord
  validates_uniqueness_of :ticker
end
