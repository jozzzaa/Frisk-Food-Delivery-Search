class Tag < ApplicationRecord
  has_many :food_tags
  has_many :foods, through: :food_tags
end
