class Transaction < ApplicationRecord
  belongs_to :category
  validates :sum, :category, presence: true
  enum direction: [ :debit, :credit ]
end
