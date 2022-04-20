class User < ApplicationRecord
  after_create :send_admin_mail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :validatable,
         :confirmable

  has_many :transactions, dependent: :destroy

  

  validates :email, uniqueness: true
  validates_presence_of :email, :firstname, :lastname, :wallet
  validates :wallet, numericality: { greater_than_or_equal_to: 0 }

  enum status: {
    pending: 0,
    approved: 1
  }, _prefix: true



  # has_many :investments, dependent: :destroy
  has_many :stocks, through: :investments

  validates :email, presence: true, uniqueness: true
  validates_presence_of :firstname, :lastname


  def active_for_authentication? 
    super && approved?
  end 
    
  def inactive_message 
    approved? ? super : :not_approved
  end


  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if recoverable.persisted?
      if recoverable.approved?
        recoverable.send_reset_password_instructions
      else
        recoverable.errors.add(:base, :not_approved)
      end
    end
    recoverable
  end
end
