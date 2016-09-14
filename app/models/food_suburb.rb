class FoodSuburb < ApplicationRecord
  belongs_to :food
  belongs_to :suburb
end
