class Table < ApplicationRecord
  has_many :orders

  validates :number, presence: true
end
