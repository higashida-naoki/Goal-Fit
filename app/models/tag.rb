class Tag < ApplicationRecord
  belongs_to :post
  enum image_type: {breakfast: 0, lunch: 1, dinner: 2}
end
