class Transaction < ApplicationRecord
  belongs_to :category
  validates :sum, :category, :direction, :published_at, presence: true
  enum direction: [ :debit, :credit ]
end
