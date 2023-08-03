class Bank < ApplicationRecord
  validates :name,:address, presence: true
  has_many :accounts, dependent: :destroy
end
