class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy
  validates :first_name,:phone_number,:cnic,:address, presence: true
  validates :phone_number,length: { is: 11 }
  validates :cnic,length: { is: 13 }
  validates :cnic, :phone_number, uniqueness: true
  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable

  enum role: {
    customer: 0,
    superadmin: 1
  }
end
