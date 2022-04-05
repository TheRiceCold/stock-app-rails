class Stock < ApplicationRecord
  has_many :invesments, dependent: :destroy
  validates :company_name, presence: true
end
