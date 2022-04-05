class Stock < ApplicationRecord
  has_many :invesments, dependent: :destroy
  validates_presence_of :symbol, :company_name, 
    :latest_price, :quantity

  after_create_commit { broadcast_prepend_to "stocks" }
  after_update_commit { broadcast_replace_to "stocks" }
  after_destroy_commit { broadcast_remove_to "stocks" }
end
