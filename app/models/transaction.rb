class Transaction < ApplicationRecord
  belongs_to :user

  enum status: {
    bought: 0,
    sold: 1
  }, _prefix: true

end
