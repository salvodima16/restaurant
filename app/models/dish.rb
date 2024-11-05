class Dish < ApplicationRecord
  has_many :quantities
  has_many :ingredients, :through => :quantities
  has_many :paper_rows
  has_many :orders, :through => :paper_rows
end
