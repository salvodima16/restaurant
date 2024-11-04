class Quantity < ApplicationRecord
  belongs_to :ingredient
  belongs_to :dish
end
