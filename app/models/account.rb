class Account < ApplicationRecord
  before_create :check_account
  belongs_to :user
  belongs_to :bank
  validates :number, :bank_id, presence: true
  validates :number, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  enum status: {
    notapproved: 0,
    approved: 1
  }
   
  def check_account
    throw :abort if self.user.accounts.any? { |item| item[:bank_id] == self.bank_id }
    debugger
  end
  
end
