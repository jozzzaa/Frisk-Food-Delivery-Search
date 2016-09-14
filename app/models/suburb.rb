class Suburb < ApplicationRecord
  has_many :food_suburbs
  has_many :foods, through: :food_suburbs
end
