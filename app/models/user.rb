class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable, :recoverable,
    :rememberable, :validatable, :confirmable

  has_many :transactions, dependent: :destroy
  has_many :investments, dependent: :destroy

  validates_presence_of :email, :firstname, :lastname, :wallet

  validates :wallet, numericality: { greater_than_or_equal_to: 0 }

  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: "invalid email"
  }, uniqueness: true

  enum status: {
    pending: 0,
    approved: 1
  }, _prefix: true

end
