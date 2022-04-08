class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :validatable

  has_many :transactions, dependent: :destroy

  validates :email, uniqueness: true
  validates_presence_of :email, :firstname, :lastname, :wallet
  validates :wallet, numericality: { greater_than_or_equal_to: 0 }

  enum status: {
    pending: 0,
    approved: 1
  }, _prefix: true
end
