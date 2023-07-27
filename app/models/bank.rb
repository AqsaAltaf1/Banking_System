class Bank < ApplicationRecord
  validates :name,:address, presence: true
end
