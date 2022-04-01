class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :validatable,
         :confirmable

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }, _prefix: true
end
