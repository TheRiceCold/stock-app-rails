class Stock < ApplicationRecord
  validates_presence_of :symbol, :company_name, :latest_price, :quantity
  validates :symbol, uniqueness: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :latest_price, numericality: { greater_than: 0 }

  after_create_commit { broadcast_prepend_to "stocks" }
  after_update_commit { broadcast_replace_to "stocks" }
  after_destroy_commit { broadcast_remove_to "stocks" }
end
