class Transaction < ApplicationRecord
  after_create :update_balance
  before_create :validate_amount
  belongs_to :user
  belongs_to :account
  validates :bank_id,:account_id,:reciever_id,:amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 500 }
  
  def validate_amount
    sender = Account.find(self.account_id)
    reciever = Account.find(self.reciever_id)
    throw :abort if sender.balance < self.amount || sender.notapproved? || reciever.notapproved?
  end

  def update_balance
    sender = Account.find(self.account_id)
    sender_balance = sender.balance
    sender.update!(balance: sender_balance -  self.amount )
    reciever = Account.find(self.reciever_id)
    reciever_balance = reciever.balance
    reciever.update!(balance: sender_balance + self.amount )
  end
end
