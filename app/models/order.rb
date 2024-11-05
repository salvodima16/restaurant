class Order < ApplicationRecord
  belongs_to :table
  has_many :paper_rows
  has_many :dish, :through => :paper_rows
end
