class Meal < ApplicationRecord
  belongs_to :post
  belongs_to :meal_type
end
