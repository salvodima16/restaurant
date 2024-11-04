class Ingredient < ApplicationRecord
  has_many :quantities
  has_many :dishes, :through => :quantities
end
