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

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }, _prefix: true

  has_many :transactions, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates_presence_of :firstname, :lastname
  validates :wallet, numericality: { greater_than_or_equal_to: 0 }
end
