class Food < ApplicationRecord
  has_many :food_tags
  has_many :tags, through: :food_tags
  has_many :food_suburbs
  has_many :suburbs, through: :food_suburbs
end
