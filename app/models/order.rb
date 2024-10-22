class Order < ApplicationRecord
  belongs_to :table
  has_many :dish
end
