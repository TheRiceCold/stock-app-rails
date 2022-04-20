class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :company_id, uniqueness: true
  validates :stocks, presence: true
end
